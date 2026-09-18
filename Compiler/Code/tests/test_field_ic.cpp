// ==============================================================================
// Tersun Gate 6 Rebuild (G6R) Unit Tests: Polymorphic Field Inline Cache
// Tests Mono IC, Poly IC (up to 4 shapes), Megamorphic fallback, and invalidation.
// ==============================================================================

#include "vm/field_ic.hpp"
#include <cassert>
#include <iostream>

using namespace setun;

static void test_field_ic_lifecycle() {
    std::cout << "[TEST] FieldIC Lifecycle: Mono -> Poly -> Megamorphic -> Invalidate...\n";

    // 1. Create shapes with field "x"
    VMShape shapeA;
    shapeA.shape_id = 1;
    shapeA.field_to_slot["x"] = 0;
    shapeA.field_to_slot["y"] = 1;

    VMShape shapeB;
    shapeB.shape_id = 2;
    shapeB.field_to_slot["z"] = 0;
    shapeB.field_to_slot["x"] = 1;

    VMShape shapeC;
    shapeC.shape_id = 3;
    shapeC.field_to_slot["x"] = 2;

    VMShape shapeD;
    shapeD.shape_id = 4;
    shapeD.field_to_slot["x"] = 3;

    VMShape shapeE;
    shapeE.shape_id = 5;
    shapeE.field_to_slot["x"] = 4;

    FieldIC ic("x");
    assert(ic.entry_count() == 0);
    assert(!ic.is_megamorphic());

    // 2. Mono lookup (Shape A)
    int sA1 = ic.get_slot(&shapeA); // Miss (1st time)
    assert(sA1 == 0);
    assert(ic.misses() == 1);
    assert(ic.hits() == 0);
    assert(ic.entry_count() == 1);

    int sA2 = ic.get_slot(&shapeA); // Hit (Mono hit!)
    assert(sA2 == 0);
    assert(ic.hits() == 1);
    assert(ic.misses() == 1);

    // 3. Poly lookup (Shape B, C, D)
    int sB = ic.get_slot(&shapeB);
    assert(sB == 1);
    assert(ic.entry_count() == 2);

    int sC = ic.get_slot(&shapeC);
    assert(sC == 2);
    assert(ic.entry_count() == 3);

    int sD = ic.get_slot(&shapeD);
    assert(sD == 3);
    assert(ic.entry_count() == 4);
    assert(!ic.is_megamorphic());

    // Repeated hits on all 4 shapes
    assert(ic.get_slot(&shapeA) == 0);
    assert(ic.get_slot(&shapeB) == 1);
    assert(ic.get_slot(&shapeC) == 2);
    assert(ic.get_slot(&shapeD) == 3);
    assert(ic.hits() == 5);

    // 4. Megamorphic transition (Shape E is 5th shape)
    int sE = ic.get_slot(&shapeE);
    assert(sE == 4);
    assert(ic.is_megamorphic());

    // 5. Invalidation
    ic.clear();
    assert(ic.entry_count() == 0);
    assert(!ic.is_megamorphic());

    int sA_reloaded = ic.get_slot(&shapeA);
    assert(sA_reloaded == 0);
    assert(ic.entry_count() == 1);

    std::cout << "  -> PASS: FieldIC Mono/Poly/Mega/Invalidation verified.\n";
}

int main() {
    test_field_ic_lifecycle();
    return 0;
}
