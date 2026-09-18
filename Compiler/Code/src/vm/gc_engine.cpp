#include "vm/gc_engine.hpp"
#include "vm/vm.hpp"
#include "vm/jit_frame.hpp"
#include <iostream>

namespace setun {

GCEngine::GCEngine(GCHeap& heap, TypeRegistry& types)
    : heap_(heap), types_(types) {}

void GCEngine::mark_pointer(void* payload) {
    if (!payload) return;
    GCHeader* hdr = GCHeader::from_payload(payload);
    if (hdr && hdr->is_white()) {
        hdr->set_color(GC_COLOR_GREY);
        grey_worklist_.push_back(hdr);
    }
}

void GCEngine::mark_value(const VMValue& val) {
    if (!val.is_heap_type()) return;
    void* payload = VMArena::instance().from_handle(val.handle());
    if (payload) {
        mark_pointer(payload);
    }
}

void GCEngine::mark_roots(VM& vm) {
    // 1. Operand Stack roots & Gate 6.0 2-Slot TOS Cache (I-TOS-04)
    const auto& stack = vm.stack();
    for (size_t i = 0; i < stack.size(); ++i) {
        mark_value(stack.data()[i]);
    }
    if (vm.tos_depth() >= 1) mark_value(vm.tos0());
    if (vm.tos_depth() == 2) mark_value(vm.tos1());

    // 2. Local variables
    const auto& locals = vm.locals();
    for (size_t i = 0; i < locals.size(); ++i) {
        mark_value(locals[i]);
    }

    // 3. Globals
    const auto& globals = vm.globals();
    for (size_t i = 0; i < globals.size(); ++i) {
        mark_value(globals[i]);
    }

    // 4. Native Handle Scope roots
    for (void* p : GCRootRegistry::instance().native_handles()) {
        mark_pointer(p);
    }

    // 5. Active JIT Frame Stack roots (Gate 5.7 Execution Contract)
    JITFrame* jframe = vm.active_jit_frame();
    while (jframe) {
        if (jframe->locals && jframe->num_locals > 0) {
            for (size_t i = 0; i < jframe->num_locals; ++i) {
                mark_value(jframe->locals[i]);
            }
        }
        if (jframe->stack_base && jframe->stack_depth > 0) {
            for (size_t i = 0; i < jframe->stack_depth; ++i) {
                mark_value(jframe->stack_base[i]);
            }
        }
        jframe = jframe->prev_jit_frame;
    }
}

void GCEngine::process_worklist() {
    while (!grey_worklist_.empty()) {
        GCHeader* hdr = grey_worklist_.back();
        grey_worklist_.pop_back();

        hdr->set_color(GC_COLOR_BLACK);

        const GCTypeDescriptor* desc = types_.get_descriptor(hdr->type_id);
        if (desc && desc->trace_fn) {
            desc->trace_fn(hdr->payload(), [this](void* ref) {
                mark_pointer(ref);
            });
        }
    }
}

size_t GCEngine::sweep_phase() {
    size_t freed_bytes = 0;

    GCRegion* r = heap_.active_regions();
    while (r) {
        size_t offset = 0;
        while (offset < r->alloc_offset) {
            auto* hdr = reinterpret_cast<GCHeader*>(r->base + offset);
            size_t total_size = sizeof(GCHeader) + hdr->size;
            total_size = (total_size + 7) & ~static_cast<size_t>(7);
            if (total_size < 16) total_size = 16;

            if (hdr->is_free()) {
                offset += total_size;
                continue;
            }

            if (hdr->is_white()) {
                // Object is dead
                const GCTypeDescriptor* desc = types_.get_descriptor(hdr->type_id);
                if (desc && desc->destruct_fn) {
                    desc->destruct_fn(hdr->payload());
                }
                heap_.recycle_small(hdr->payload(), total_size);
                freed_bytes += total_size;
            } else if (hdr->is_black()) {
                // Object survived: reset to white for next collection, advance age
                hdr->set_color(GC_COLOR_WHITE);
                if (hdr->age < 255) hdr->age++;
            }
            offset += total_size;
        }
        r = r->next;
    }

    heap_.record_sweep(freed_bytes);
    return freed_bytes;
}

size_t GCEngine::collect_garbage(VM& vm) {
    grey_worklist_.clear();

    // 1. Mark phase
    mark_roots(vm);
    process_worklist();

    // 2. Sweep phase
    size_t freed = sweep_phase();

    total_collections_++;
    total_bytes_freed_ += freed;

    // 3. Dynamically adapt next threshold
    size_t live = heap_.bytes_live();
    gc_threshold_ = std::max(live * 2, min_threshold_);

    return freed;
}

} // namespace setun
