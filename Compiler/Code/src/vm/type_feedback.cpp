#include "vm/type_feedback.hpp"
#include <algorithm>

namespace setun {

void TypeFeedbackVector::record_binary_op(uint32_t ip, VMValue left, VMValue right) {
    BinaryOpFeedback* slot = nullptr;
    for (auto& s : binary_slots_) {
        if (s.bytecode_ip == ip) {
            slot = &s;
            break;
        }
    }

    uint64_t l_tag = left.major_tag();
    uint64_t r_tag = right.major_tag();

    if (!slot) {
        BinaryOpFeedback new_slot;
        new_slot.bytecode_ip = ip;
        new_slot.left_tag = l_tag;
        new_slot.right_tag = r_tag;
        new_slot.total_observations = 1;
        new_slot.state = FeedbackState::Monomorphic;
        binary_slots_.push_back(new_slot);
    } else {
        slot->total_observations++;
        if (slot->left_tag != l_tag || slot->right_tag != r_tag) {
            slot->state = FeedbackState::Polymorphic;
        }
    }
}

void TypeFeedbackVector::record_shape(uint32_t ip, uint64_t shape_id) {
    ShapeFeedback* slot = nullptr;
    for (auto& s : shape_slots_) {
        if (s.bytecode_ip == ip) {
            slot = &s;
            break;
        }
    }

    if (!slot) {
        ShapeFeedback new_slot;
        new_slot.bytecode_ip = ip;
        new_slot.observed_shapes.push_back(shape_id);
        new_slot.total_observations = 1;
        new_slot.state = FeedbackState::Monomorphic;
        shape_slots_.push_back(new_slot);
    } else {
        slot->total_observations++;
        if (std::find(slot->observed_shapes.begin(), slot->observed_shapes.end(), shape_id) == slot->observed_shapes.end()) {
            slot->observed_shapes.push_back(shape_id);
            if (slot->observed_shapes.size() <= 4) {
                slot->state = FeedbackState::Polymorphic;
            } else {
                slot->state = FeedbackState::Megamorphic;
            }
        }
    }
}

void TypeFeedbackVector::record_method(uint32_t ip, const std::string& method_name, uint32_t shape_id, uint32_t fn_entry) {
    MethodFeedback* slot = nullptr;
    for (auto& s : method_slots_) {
        if (s.bytecode_ip == ip) {
            slot = &s;
            break;
        }
    }

    if (!slot) {
        MethodFeedback new_slot;
        new_slot.bytecode_ip = ip;
        new_slot.method_name = method_name;
        new_slot.observed_shapes.push_back(shape_id);
        new_slot.target_fn_entries.push_back(fn_entry);
        new_slot.total_observations = 1;
        new_slot.state = FeedbackState::Monomorphic;
        method_slots_.push_back(new_slot);
    } else {
        slot->total_observations++;
        auto it = std::find(slot->observed_shapes.begin(), slot->observed_shapes.end(), shape_id);
        if (it == slot->observed_shapes.end()) {
            slot->observed_shapes.push_back(shape_id);
            slot->target_fn_entries.push_back(fn_entry);
            if (slot->observed_shapes.size() <= 4) {
                slot->state = FeedbackState::Polymorphic;
            } else {
                slot->state = FeedbackState::Megamorphic;
            }
        }
    }
}

std::unique_ptr<ProfileSnapshot> TypeFeedbackVector::freeze_snapshot() const {
    auto snap = std::make_unique<ProfileSnapshot>();
    snap->function_id = function_id_;
    snap->invocation_count = invocation_count_;
    snap->backedge_count = backedge_count_;
    snap->binary_slots = binary_slots_;
    snap->shape_slots = shape_slots_;
    snap->method_slots = method_slots_;
    snap->is_frozen = true;
    return snap;
}

} // namespace setun

