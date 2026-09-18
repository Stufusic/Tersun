#include "vm/type_descriptor.hpp"
#include "vm/value.hpp"

namespace setun {

static void trace_array_payload(void* payload, const GCVisitor& visitor) {
    if (!payload) return;
    auto* arr = reinterpret_cast<ArrayObject*>(payload);
    if (arr->rep == ArrayRep::Generic) {
        for (const auto& elem : arr->generic_data) {
            if (elem.is_heap_type()) {
                void* p = VMArena::instance().from_handle(elem.handle());
                if (p) visitor(p);
            }
        }
    }
}

static void destruct_array_payload(void* payload) {
    if (!payload) return;
    auto* arr = reinterpret_cast<ArrayObject*>(payload);
    arr->~ArrayObject();
}

static void trace_object_payload(void* payload, const GCVisitor& visitor) {
    if (!payload) return;
    auto* obj = reinterpret_cast<VMObject*>(payload);
    for (const auto& f : obj->fields_array) {
        if (f.is_heap_type()) {
            void* p = VMArena::instance().from_handle(f.handle());
            if (p) visitor(p);
        }
    }
    if (obj->dynamic_fields) {
        for (const auto& kv : *obj->dynamic_fields) {
            if (kv.second.is_heap_type()) {
                void* p = VMArena::instance().from_handle(kv.second.handle());
                if (p) visitor(p);
            }
        }
    }
}

static void destruct_object_payload(void* payload) {
    if (!payload) return;
    auto* obj = reinterpret_cast<VMObject*>(payload);
    obj->~VMObject();
}

static void trace_closure_payload(void* payload, const GCVisitor& visitor) {
    if (!payload) return;
    auto* fn = reinterpret_cast<VMClosure*>(payload);
    for (const auto& cap : fn->captures) {
        if (cap.is_heap_type()) {
            void* p = VMArena::instance().from_handle(cap.handle());
            if (p) visitor(p);
        }
    }
}

static void destruct_closure_payload(void* payload) {
    if (!payload) return;
    auto* fn = reinterpret_cast<VMClosure*>(payload);
    fn->~VMClosure();
}

static void destruct_string_payload(void* payload) {
    if (!payload) return;
    auto* str = reinterpret_cast<std::string*>(payload);
    str->~basic_string();
}

TypeRegistry::TypeRegistry() {
    init_builtins();
}

void TypeRegistry::init_builtins() {
    descriptors_.clear();
    name_to_id_.clear();
    descriptors_.resize(TYPE_ID_USER_BASE);

    // 0: Raw Bytes
    {
        GCTypeDescriptor d;
        d.type_id = TYPE_ID_RAW_BYTES;
        d.type_name = "RawBytes";
        descriptors_[TYPE_ID_RAW_BYTES] = d;
        name_to_id_[d.type_name] = d.type_id;
    }
    // 1: String
    {
        GCTypeDescriptor d;
        d.type_id = TYPE_ID_STRING;
        d.type_name = "String";
        d.instance_size = sizeof(std::string);
        d.destruct_fn = destruct_string_payload;
        descriptors_[TYPE_ID_STRING] = d;
        name_to_id_[d.type_name] = d.type_id;
    }
    // 2: TAFPU
    {
        GCTypeDescriptor d;
        d.type_id = TYPE_ID_TAFPU;
        d.type_name = "TAFPU";
        d.instance_size = sizeof(TafpuNum);
        descriptors_[TYPE_ID_TAFPU] = d;
        name_to_id_[d.type_name] = d.type_id;
    }
    // 3: Array
    {
        GCTypeDescriptor d;
        d.type_id = TYPE_ID_ARRAY;
        d.type_name = "Array";
        d.instance_size = sizeof(std::vector<VMValue>);
        d.trace_fn = trace_array_payload;
        d.destruct_fn = destruct_array_payload;
        descriptors_[TYPE_ID_ARRAY] = d;
        name_to_id_[d.type_name] = d.type_id;
    }
    // 4: Object
    {
        GCTypeDescriptor d;
        d.type_id = TYPE_ID_OBJECT;
        d.type_name = "Object";
        d.instance_size = sizeof(VMObject);
        d.trace_fn = trace_object_payload;
        d.destruct_fn = destruct_object_payload;
        descriptors_[TYPE_ID_OBJECT] = d;
        name_to_id_[d.type_name] = d.type_id;
    }
    // 5: Closure
    {
        GCTypeDescriptor d;
        d.type_id = TYPE_ID_CLOSURE;
        d.type_name = "Closure";
        d.instance_size = sizeof(VMClosure);
        d.trace_fn = trace_closure_payload;
        d.destruct_fn = destruct_closure_payload;
        descriptors_[TYPE_ID_CLOSURE] = d;
        name_to_id_[d.type_name] = d.type_id;
    }
    // 6: Boxed Int64
    {
        GCTypeDescriptor d;
        d.type_id = TYPE_ID_BOXED_INT;
        d.type_name = "BoxedInt64";
        d.instance_size = sizeof(int64_t);
        descriptors_[TYPE_ID_BOXED_INT] = d;
        name_to_id_[d.type_name] = d.type_id;
    }
}

uint32_t TypeRegistry::register_type(const GCTypeDescriptor& desc) {
    auto it = name_to_id_.find(desc.type_name);
    if (it != name_to_id_.end()) {
        descriptors_[it->second] = desc;
        descriptors_[it->second].type_id = it->second;
        return it->second;
    }
    uint32_t id = next_user_id_++;
    GCTypeDescriptor copy = desc;
    copy.type_id = id;
    if (descriptors_.size() <= id) {
        descriptors_.resize(id + 1);
    }
    descriptors_[id] = copy;
    name_to_id_[copy.type_name] = id;
    return id;
}

const GCTypeDescriptor* TypeRegistry::get_descriptor(uint32_t type_id) const {
    if (type_id < descriptors_.size()) {
        return &descriptors_[type_id];
    }
    return nullptr;
}

const GCTypeDescriptor* TypeRegistry::find_by_name(const std::string& name) const {
    auto it = name_to_id_.find(name);
    if (it != name_to_id_.end()) {
        return get_descriptor(it->second);
    }
    return nullptr;
}

void TypeRegistry::reset_user_types() {
    init_builtins();
    next_user_id_ = TYPE_ID_USER_BASE;
}

} // namespace setun
