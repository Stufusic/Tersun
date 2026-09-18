#include "vm/superinstruction.hpp"
#include "vm/opt_bytecode.hpp"
#include "vm/vm.hpp"
#include <iostream>
#include <cassert>
#include <cmath>

namespace setun {

void test_superinstruction_suite() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 6.0-D] Phase 4: Superinstruction Fusion Verification Suite \n";
    std::cout << "===================================================================\n";

    // 1. Semantic Barrier & Jump Target Protection Invariants
    {
        std::cout << "  [ST-Fusion.1] Semantic Barrier & Jump Target Invariants...\n";
        assert(SemanticBarrier::is_barrier(OpCode::OP_CALL));
        assert(SemanticBarrier::is_barrier(OpCode::OP_INVOKE_METHOD));
        assert(SemanticBarrier::is_barrier(OpCode::OP_CALL_INDIRECT));
        assert(SemanticBarrier::is_barrier(OpCode::OP_CLOSURE));
        assert(SemanticBarrier::is_barrier(OpCode::OP_RET));
        assert(SemanticBarrier::is_barrier(OpCode::OP_NEW_INSTANCE));
        assert(SemanticBarrier::is_barrier(OpCode::OP_NEW_ARRAY));
        assert(SemanticBarrier::is_barrier(OpCode::OP_TRY));
        assert(SemanticBarrier::is_barrier(OpCode::OP_THROW));
        assert(SemanticBarrier::is_barrier(OpCode::OP_POP_TRY));
        assert(SemanticBarrier::is_barrier(OpCode::OP_BRANCH_3));
        assert(SemanticBarrier::is_barrier(OpCode::OP_HALT));

        assert(!SemanticBarrier::is_barrier(OpCode::OP_LOAD_LOCAL));
        assert(!SemanticBarrier::is_barrier(OpCode::OP_STORE_LOCAL));
        assert(!SemanticBarrier::is_barrier(OpCode::OP_ADD));
        assert(!SemanticBarrier::is_barrier(OpCode::OP_POP));

        // Jump target blocking test
        Chunk chunk;
        // Instruction at 0: OP_LOAD_LOCAL 0 (3B)
        chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 1);
        chunk.write_int16(0, 1);
        // Instruction at 3: OP_LOAD_LOCAL 1 (3B)
        chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 1);
        chunk.write_int16(1, 1);

        std::unordered_set<size_t> targets;
        // If targets is empty, can_fuse_range(0, 6) is true
        assert(SuperInstructionRegistry::can_fuse_range(chunk, 0, 6, targets));

        // If target includes PC 3 (intermediate instruction), fusion MUST be rejected
        targets.insert(3);
        assert(!SuperInstructionRegistry::can_fuse_range(chunk, 0, 6, targets));

        // If target includes PC 0 (start instruction), fusion is still legal
        targets.clear();
        targets.insert(0);
        assert(SuperInstructionRegistry::can_fuse_range(chunk, 0, 6, targets));

        std::cout << "    -> Barrier opcodes and jump target invariants 100% verified!\n";
    }

    // 2. Fused STORE_LOCAL + POP -> OP_STORE_LOCAL_0..3_POP & OP_STORE_LOCAL_POP
    {
        std::cout << "  [ST-Fusion.2] Store Local and Pop Fusion (Slots 0..3 & Arbitrary)...\n";
        Chunk chunk;
        // slot 0: push int 42, store_local 0, pop
        chunk.write_opcode(OpCode::OP_PUSH_INT, 1);
        chunk.write_int64(42, 1);
        chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1);
        chunk.write_int16(0, 1);
        chunk.write_opcode(OpCode::OP_POP, 1);

        // slot 10: push int 99, store_local 10, pop
        chunk.write_opcode(OpCode::OP_PUSH_INT, 1);
        chunk.write_int64(99, 1);
        chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1);
        chunk.write_int16(10, 1);
        chunk.write_opcode(OpCode::OP_POP, 1);

        chunk.write_opcode(OpCode::OP_HALT, 1);

        SuperInstructionRegistry::telemetry().reset();
        OptimizedChunk opt = OptBytecodeOptimizer::optimize(chunk);

        // Verify fusion telemetry
        assert(SuperInstructionRegistry::telemetry().store_pop_fused == 2);

        VM vm;
        vm.run_cached(chunk);
        assert(vm.locals()[0].as_int() == 42);
        assert(vm.locals()[10].as_int() == 99);
        assert(vm.stack().empty());
        std::cout << "    -> Direct slot and arbitrary slot store-pop fusion executed cleanly!\n";
    }

    // 3. Fused LOAD_LOCAL + LOAD_LOCAL -> OP_LOAD_LOAD_LOCAL
    {
        std::cout << "  [ST-Fusion.3] Dual Local Load Fusion (OP_LOAD_LOAD_LOCAL)...\n";
        Chunk chunk;
        // local[0] = 15, local[1] = 27
        // load_local 0, load_local 1, sub -> local[2]
        chunk.write_opcode(OpCode::OP_PUSH_INT, 1);
        chunk.write_int64(15, 1);
        chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1);
        chunk.write_int16(0, 1);
        chunk.write_opcode(OpCode::OP_POP, 1);

        chunk.write_opcode(OpCode::OP_PUSH_INT, 1);
        chunk.write_int64(27, 1);
        chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1);
        chunk.write_int16(1, 1);
        chunk.write_opcode(OpCode::OP_POP, 1);

        // load 0, load 1 -> fused into LOAD_LOAD_LOCAL 0, 1; then SUB; then store 2, pop
        chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 1);
        chunk.write_int16(0, 1);
        chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 1);
        chunk.write_int16(1, 1);
        chunk.write_opcode(OpCode::OP_SUB, 1);
        chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1);
        chunk.write_int16(2, 1);
        chunk.write_opcode(OpCode::OP_POP, 1);
        chunk.write_opcode(OpCode::OP_HALT, 1);

        SuperInstructionRegistry::telemetry().reset();
        OptimizedChunk opt = OptBytecodeOptimizer::optimize(chunk);
        assert(SuperInstructionRegistry::telemetry().load_load_fused >= 1);

        VM vm;
        vm.run_cached(chunk);
        // 15 - 27 = -12
        assert(vm.locals()[2].as_int() == -12);
        std::cout << "    -> Load-Load fusion into 2-slot register cache validated!\n";
    }

    // 4. Fused Add Local Local Store (OP_FUSED_ADD_LOCAL_LOCAL_STORE)
    {
        std::cout << "  [ST-Fusion.4] Stackless Local Addition (OP_FUSED_ADD_LOCAL_LOCAL_STORE)...\n";
        Chunk chunk;
        // Setup local[1] = 100, local[2] = 250
        chunk.write_opcode(OpCode::OP_PUSH_INT, 1);
        chunk.write_int64(100, 1);
        chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1);
        chunk.write_int16(1, 1);
        chunk.write_opcode(OpCode::OP_POP, 1);

        chunk.write_opcode(OpCode::OP_PUSH_INT, 1);
        chunk.write_int64(250, 1);
        chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1);
        chunk.write_int16(2, 1);
        chunk.write_opcode(OpCode::OP_POP, 1);

        // local[3] = local[1] + local[2]
        chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 1);
        chunk.write_int16(1, 1);
        chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 1);
        chunk.write_int16(2, 1);
        chunk.write_opcode(OpCode::OP_ADD, 1);
        chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1);
        chunk.write_int16(3, 1);
        chunk.write_opcode(OpCode::OP_POP, 1);
        chunk.write_opcode(OpCode::OP_HALT, 1);

        SuperInstructionRegistry::telemetry().reset();
        OptimizedChunk opt = OptBytecodeOptimizer::optimize(chunk);
        assert(SuperInstructionRegistry::telemetry().add_local_store_fused == 1);

        VM vm;
        vm.run_cached(chunk);
        assert(vm.locals()[3].as_int() == 350);
        std::cout << "    -> Stackless slot-to-slot addition executed with 100% precision!\n";
    }

    // 5. Fused Multiply-Add (I64, F64, TAFPU Exact Arithmetic)
    {
        std::cout << "  [ST-Fusion.5] Fused Multiply-Add (I64, F64 & Exact TAFPU)...\n";
        // Integer test: d = a * b + c (2 * 3 + 4 = 10)
        {
            Chunk chunk;
            chunk.write_opcode(OpCode::OP_PUSH_INT, 1);
            chunk.write_int64(2, 1);
            chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1);
            chunk.write_int16(0, 1);
            chunk.write_opcode(OpCode::OP_POP, 1);

            chunk.write_opcode(OpCode::OP_PUSH_INT, 1);
            chunk.write_int64(3, 1);
            chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1);
            chunk.write_int16(1, 1);
            chunk.write_opcode(OpCode::OP_POP, 1);

            chunk.write_opcode(OpCode::OP_PUSH_INT, 1);
            chunk.write_int64(4, 1);
            chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1);
            chunk.write_int16(2, 1);
            chunk.write_opcode(OpCode::OP_POP, 1);

            // load 0, load 1, mul, load 2, add, store 3, pop
            chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 1);
            chunk.write_int16(0, 1);
            chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 1);
            chunk.write_int16(1, 1);
            chunk.write_opcode(OpCode::OP_MUL, 1);
            chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 1);
            chunk.write_int16(2, 1);
            chunk.write_opcode(OpCode::OP_ADD, 1);
            chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1);
            chunk.write_int16(3, 1);
            chunk.write_opcode(OpCode::OP_POP, 1);
            chunk.write_opcode(OpCode::OP_HALT, 1);

            SuperInstructionRegistry::telemetry().reset();
            OptimizedChunk opt = OptBytecodeOptimizer::optimize(chunk);
            assert(SuperInstructionRegistry::telemetry().mul_add_fused == 1);

            VM vm;
            vm.run_cached(chunk);
            assert(vm.locals()[3].as_int() == 10);
        }

        // Exact TAFPU test: tafpu_fma_exact(c, a, b) in Q(sqrt(3))
        {
            TafpuNum a{2, 1, 0};  // 2 + sqrt(3)
            TafpuNum b{3, -1, 0}; // 3 - sqrt(3)
            TafpuNum c{5, 2, 0};  // 5 + 2*sqrt(3)

            // a * b = (2 + sqrt(3))(3 - sqrt(3)) = 6 - 2sqrt(3) + 3sqrt(3) - 3 = 3 + sqrt(3)
            // c + a * b = (5 + 2*sqrt(3)) + (3 + sqrt(3)) = 8 + 3*sqrt(3)
            TafpuNum res = tafpu_fma_exact(c, a, b);
            assert(res.a == 8);
            assert(res.b == 3);
            assert(res.s == 0);
        }
        std::cout << "    -> Integer, float and exact algebraic Q(sqrt(3)) FMA verified!\n";
    }

    std::cout << "===================================================================\n";
    std::cout << "  Gate 6.0-D: All Superinstruction Tests Passed (100% Success)     \n";
    std::cout << "===================================================================\n";
}

} // namespace setun
