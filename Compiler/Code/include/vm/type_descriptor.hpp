#pragma once

#include "vm/gc_header.hpp"
#include <cstdint>
#include <cstddef>
#include <string>
#include <vector>
#include <functional>
#include <unordered_map>
#include <memory>

namespace setun {

// ============================================================================
// Gate 5.6B: GC Type Descriptor & Registry
// ============================================================================

enum WellKnownTypeID : uint32_t {
    TYPE_ID_RAW_BYTES = 0,
    TYPE_ID_STRING    = 1,
    TYPE_ID_TAFPU     = 2,
    TYPE_ID_ARRAY     = 3,
    TYPE_ID_OBJECT    = 4,
    TYPE_ID_CLOSURE   = 5,
    TYPE_ID_BOXED_INT = 6,
    TYPE_ID_USER_BASE = 16
};

// Visitor callback invoked for every managed pointer inside an object
using GCVisitor = std::function<void(void* ref_payload)>;

struct GCTypeDescriptor {
    uint32_t type_id{0};
    std::string type_name;
    size_t instance_size{0};
    uint64_t pointer_mask{0}; // Bit i = 1 means (VMValue*)payload + i is a potential GC reference

    // Custom tracer for dynamic-length or indirect structures (arrays, objects)
    void (*trace_fn)(void* payload, const GCVisitor& visitor){nullptr};

    // Custom destructor / finalizer for non-trivial C++ members
    void (*destruct_fn)(void* payload){nullptr};
};

class TypeRegistry {
public:
    static TypeRegistry& instance() {
        static TypeRegistry s_instance;
        return s_instance;
    }

    TypeRegistry();

    uint32_t register_type(const GCTypeDescriptor& desc);
    const GCTypeDescriptor* get_descriptor(uint32_t type_id) const;
    const GCTypeDescriptor* find_by_name(const std::string& name) const;

    void reset_user_types();

private:
    void init_builtins();

    std::vector<GCTypeDescriptor> descriptors_;
    std::unordered_map<std::string, uint32_t> name_to_id_;
    uint32_t next_user_id_{TYPE_ID_USER_BASE};
};

} // namespace setun
