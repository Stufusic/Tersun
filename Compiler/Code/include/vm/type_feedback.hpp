#pragma once

#include "vm/value.hpp"
#include <cstdint>
#include <vector>
#include <memory>
#include <string>

namespace setun {

// ============================================================================
// Gate 5.9 (Advanced): Type Feedback Vector & Profile Snapshot System
// ============================================================================

enum class FeedbackState : uint8_t {
    Unknown = 0,
    Monomorphic = 1,
    Polymorphic = 2,
    Megamorphic = 3
};

struct BinaryOpFeedback {
    uint32_t bytecode_ip{0};
    uint64_t left_tag{VMValue::TAG_INT};
    uint64_t right_tag{VMValue::TAG_INT};
    uint64_t total_observations{0};
    FeedbackState state{FeedbackState::Unknown};

    bool is_monomorphic_int() const {
        return (state == FeedbackState::Monomorphic || state == FeedbackState::Unknown) &&
               left_tag == VMValue::TAG_INT && right_tag == VMValue::TAG_INT;
    }
};

struct ShapeFeedback {
    uint32_t bytecode_ip{0};
    std::vector<uint64_t> observed_shapes; // List of ShapeIDs
    uint64_t total_observations{0};
    FeedbackState state{FeedbackState::Unknown};

    bool is_monomorphic() const {
        return state == FeedbackState::Monomorphic && observed_shapes.size() == 1;
    }

    uint64_t monomorphic_shape() const {
        return observed_shapes.empty() ? 0 : observed_shapes[0];
    }
};

struct MethodFeedback {
    uint32_t bytecode_ip{0};
    std::string method_name;
    std::vector<uint32_t> observed_shapes;
    std::vector<uint32_t> target_fn_entries;
    uint64_t total_observations{0};
    FeedbackState state{FeedbackState::Unknown};

    bool is_monomorphic() const {
        return state == FeedbackState::Monomorphic && observed_shapes.size() == 1;
    }

    uint32_t monomorphic_shape() const {
        return observed_shapes.empty() ? 0 : observed_shapes[0];
    }

    uint32_t monomorphic_fn_entry() const {
        return target_fn_entries.empty() ? 0 : target_fn_entries[0];
    }

    bool is_polymorphic() const {
        return state == FeedbackState::Polymorphic && observed_shapes.size() >= 2 && observed_shapes.size() <= 4;
    }

    bool is_megamorphic() const {
        return state == FeedbackState::Megamorphic;
    }
};

struct ProfileSnapshot {
    uint32_t function_id{0};
    uint64_t invocation_count{0};
    uint64_t backedge_count{0};
    std::vector<BinaryOpFeedback> binary_slots;
    std::vector<ShapeFeedback> shape_slots;
    std::vector<MethodFeedback> method_slots;
    bool is_frozen{true};

    const BinaryOpFeedback* find_binary_slot(uint32_t ip) const {
        for (const auto& slot : binary_slots) {
            if (slot.bytecode_ip == ip) return &slot;
        }
        return nullptr;
    }

    const ShapeFeedback* find_shape_slot(uint32_t ip) const {
        for (const auto& slot : shape_slots) {
            if (slot.bytecode_ip == ip) return &slot;
        }
        return nullptr;
    }

    const MethodFeedback* find_method_slot(uint32_t ip) const {
        for (const auto& slot : method_slots) {
            if (slot.bytecode_ip == ip) return &slot;
        }
        return nullptr;
    }
};

class TypeFeedbackVector {
public:
    explicit TypeFeedbackVector(uint32_t func_id = 0) : function_id_(func_id) {}

    void record_binary_op(uint32_t ip, VMValue left, VMValue right);
    void record_shape(uint32_t ip, uint64_t shape_id);
    void record_method(uint32_t ip, const std::string& method_name, uint32_t shape_id, uint32_t fn_entry);
    void record_method(uint32_t ip, uint32_t shape_id, uint32_t fn_entry) {
        record_method(ip, "", shape_id, fn_entry);
    }
    void record_invocation() { invocation_count_++; }
    void record_backedge() { backedge_count_++; }

    uint64_t invocation_count() const { return invocation_count_; }
    uint64_t backedge_count() const { return backedge_count_; }

    // Creates an immutable frozen snapshot for Tier-2 optimization
    std::unique_ptr<ProfileSnapshot> freeze_snapshot() const;

private:
    uint32_t function_id_{0};
    uint64_t invocation_count_{0};
    uint64_t backedge_count_{0};
    std::vector<BinaryOpFeedback> binary_slots_;
    std::vector<ShapeFeedback> shape_slots_;
    std::vector<MethodFeedback> method_slots_;
};

} // namespace setun
