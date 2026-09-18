#include "vm/array_storage.hpp"
#include "vm/value.hpp"
#include <algorithm>

namespace setun {

ArrayObject::ArrayObject(size_t initial_capacity, ArrayRep r) : rep(r) {
    reserve(initial_capacity);
}

ArrayObject::ArrayObject(std::vector<VMValue> data) : rep(ArrayRep::Generic), generic_data(std::move(data)) {
    try_promote();
}

ArrayObject::ArrayObject(std::vector<int64_t> data) : rep(ArrayRep::I64), i64_data(std::move(data)) {}
ArrayObject::ArrayObject(std::vector<uint8_t> data) : rep(ArrayRep::U8), u8_data(std::move(data)) {}
ArrayObject::ArrayObject(std::vector<double> data)  : rep(ArrayRep::F64), f64_data(std::move(data)) {}
ArrayObject::ArrayObject(std::vector<TafpuNum> data) : rep(ArrayRep::TAFPU), tafpu_data(std::move(data)) {}

size_t ArrayObject::size() const noexcept {
    switch (rep) {
        case ArrayRep::I64:     return i64_data.size();
        case ArrayRep::U8:      return u8_data.size();
        case ArrayRep::F64:     return f64_data.size();
        case ArrayRep::TAFPU:   return tafpu_data.size();
        case ArrayRep::Generic:
        default:                return generic_data.size();
    }
}

size_t ArrayObject::capacity() const noexcept {
    switch (rep) {
        case ArrayRep::I64:     return i64_data.capacity();
        case ArrayRep::U8:      return u8_data.capacity();
        case ArrayRep::F64:     return f64_data.capacity();
        case ArrayRep::TAFPU:   return tafpu_data.capacity();
        case ArrayRep::Generic:
        default:                return generic_data.capacity();
    }
}

bool ArrayObject::empty() const noexcept {
    return size() == 0;
}

void ArrayObject::resize(size_t new_size) {
    switch (rep) {
        case ArrayRep::I64:     i64_data.resize(new_size, 0); break;
        case ArrayRep::U8:      u8_data.resize(new_size, 0); break;
        case ArrayRep::F64:     f64_data.resize(new_size, 0.0); break;
        case ArrayRep::TAFPU:   tafpu_data.resize(new_size, TafpuNum{0, 0, 0}); break;
        case ArrayRep::Generic:
        default:                generic_data.resize(new_size, VMValue()); break;
    }
}

void ArrayObject::reserve(size_t new_cap) {
    switch (rep) {
        case ArrayRep::I64:     i64_data.reserve(new_cap); break;
        case ArrayRep::U8:      u8_data.reserve(new_cap); break;
        case ArrayRep::F64:     f64_data.reserve(new_cap); break;
        case ArrayRep::TAFPU:   tafpu_data.reserve(new_cap); break;
        case ArrayRep::Generic:
        default:                generic_data.reserve(new_cap); break;
    }
}

void ArrayObject::clear() noexcept {
    i64_data.clear();
    u8_data.clear();
    f64_data.clear();
    tafpu_data.clear();
    generic_data.clear();
}

VMValue ArrayObject::get(size_t index) const {
    switch (rep) {
        case ArrayRep::I64:
            if (index < i64_data.size()) return VMValue(i64_data[index]);
            break;
        case ArrayRep::U8:
            if (index < u8_data.size()) return VMValue(static_cast<int64_t>(u8_data[index]));
            break;
        case ArrayRep::F64:
            if (index < f64_data.size()) return VMValue(f64_data[index]);
            break;
        case ArrayRep::TAFPU:
            if (index < tafpu_data.size()) return VMValue(tafpu_data[index]);
            break;
        case ArrayRep::Generic:
        default:
            if (index < generic_data.size()) return generic_data[index];
            break;
    }
    return VMValue(static_cast<int64_t>(0));
}

void ArrayObject::set(size_t index, const VMValue& val) {
    switch (rep) {
        case ArrayRep::I64:
            if (val.is_immediate_int()) {
                if (index < i64_data.size()) {
                    i64_data[index] = val.as_immediate_int_fast();
                    return;
                }
            } else if (val.is_int()) {
                if (index < i64_data.size()) {
                    i64_data[index] = val.as_int();
                    return;
                }
            }
            degrade_to_generic();
            break;
        case ArrayRep::U8:
            if (val.is_immediate_int()) {
                int64_t iv = val.as_immediate_int_fast();
                if (iv >= 0 && iv <= 255 && index < u8_data.size()) {
                    u8_data[index] = static_cast<uint8_t>(iv);
                    return;
                }
            }
            degrade_to_generic();
            break;
        case ArrayRep::F64:
            if (val.is_float()) {
                if (index < f64_data.size()) {
                    f64_data[index] = val.as_float();
                    return;
                }
            }
            degrade_to_generic();
            break;
        case ArrayRep::TAFPU:
            if (val.is_tafpu()) {
                if (index < tafpu_data.size()) {
                    tafpu_data[index] = val.as_tafpu();
                    return;
                }
            }
            degrade_to_generic();
            break;
        case ArrayRep::Generic:
        default:
            break;
    }
    if (index < generic_data.size()) {
        generic_data[index] = val;
    }
}

bool ArrayObject::try_promote() {
    if (rep != ArrayRep::Generic || generic_data.empty()) return false;

    bool all_imm_int = true;
    bool all_float = true;
    bool all_tafpu = true;

    for (const auto& v : generic_data) {
        if (!v.is_immediate_int() && !v.is_int()) {
            all_imm_int = false;
        }
        if (!v.is_float()) all_float = false;
        if (!v.is_tafpu()) all_tafpu = false;
    }

    // Homogeneous 64-bit integer promotion
    if (all_imm_int) {
        i64_data.resize(generic_data.size());
        for (size_t i = 0; i < generic_data.size(); ++i) {
            i64_data[i] = generic_data[i].is_immediate_int() ? generic_data[i].as_immediate_int_fast() : generic_data[i].as_int();
        }
        generic_data.clear();
        generic_data.shrink_to_fit();
        rep = ArrayRep::I64;
        return true;
    }

    // Homogeneous 64-bit float promotion
    if (all_float) {
        f64_data.resize(generic_data.size());
        for (size_t i = 0; i < generic_data.size(); ++i) {
            f64_data[i] = generic_data[i].as_float();
        }
        generic_data.clear();
        generic_data.shrink_to_fit();
        rep = ArrayRep::F64;
        return true;
    }

    // Homogeneous Q(sqrt(3)) TAFPU promotion
    if (all_tafpu) {
        tafpu_data.resize(generic_data.size());
        for (size_t i = 0; i < generic_data.size(); ++i) {
            tafpu_data[i] = generic_data[i].as_tafpu();
        }
        generic_data.clear();
        generic_data.shrink_to_fit();
        rep = ArrayRep::TAFPU;
        return true;
    }

    return false;
}

void ArrayObject::degrade_to_generic() {
    if (rep == ArrayRep::Generic) return;

    switch (rep) {
        case ArrayRep::I64:
            generic_data.resize(i64_data.size());
            for (size_t i = 0; i < i64_data.size(); ++i) {
                generic_data[i] = VMValue(i64_data[i]);
            }
            i64_data.clear();
            i64_data.shrink_to_fit();
            break;
        case ArrayRep::U8:
            generic_data.resize(u8_data.size());
            for (size_t i = 0; i < u8_data.size(); ++i) {
                generic_data[i] = VMValue(static_cast<int64_t>(u8_data[i]));
            }
            u8_data.clear();
            u8_data.shrink_to_fit();
            break;
        case ArrayRep::F64:
            generic_data.resize(f64_data.size());
            for (size_t i = 0; i < f64_data.size(); ++i) {
                generic_data[i] = VMValue(f64_data[i]);
            }
            f64_data.clear();
            f64_data.shrink_to_fit();
            break;
        case ArrayRep::TAFPU:
            generic_data.resize(tafpu_data.size());
            for (size_t i = 0; i < tafpu_data.size(); ++i) {
                generic_data[i] = VMValue(tafpu_data[i]);
            }
            tafpu_data.clear();
            tafpu_data.shrink_to_fit();
            break;
        default:
            break;
    }
    rep = ArrayRep::Generic;
}

void ArrayObject::push_back(const VMValue& val) {
    switch (rep) {
        case ArrayRep::I64:
            if (val.is_immediate_int()) {
                i64_data.push_back(val.as_immediate_int_fast());
                return;
            } else if (val.is_int()) {
                i64_data.push_back(val.as_int());
                return;
            }
            degrade_to_generic();
            break;
        case ArrayRep::U8:
            if (val.is_immediate_int()) {
                int64_t iv = val.as_immediate_int_fast();
                if (iv >= 0 && iv <= 255) {
                    u8_data.push_back(static_cast<uint8_t>(iv));
                    return;
                }
            }
            degrade_to_generic();
            break;
        case ArrayRep::F64:
            if (val.is_float()) {
                f64_data.push_back(val.as_float());
                return;
            }
            degrade_to_generic();
            break;
        case ArrayRep::TAFPU:
            if (val.is_tafpu()) {
                tafpu_data.push_back(val.as_tafpu());
                return;
            }
            degrade_to_generic();
            break;
        case ArrayRep::Generic:
        default:
            break;
    }
    generic_data.push_back(val);
}

void ArrayObject::pop_back() {
    switch (rep) {
        case ArrayRep::I64:     if (!i64_data.empty()) i64_data.pop_back(); break;
        case ArrayRep::U8:      if (!u8_data.empty()) u8_data.pop_back(); break;
        case ArrayRep::F64:     if (!f64_data.empty()) f64_data.pop_back(); break;
        case ArrayRep::TAFPU:   if (!tafpu_data.empty()) tafpu_data.pop_back(); break;
        case ArrayRep::Generic:
        default:                if (!generic_data.empty()) generic_data.pop_back(); break;
    }
}

VMValue ArrayObject::back() const {
    if (empty()) return VMValue();
    return get(size() - 1);
}

void* ArrayObject::raw_data() noexcept {
    switch (rep) {
        case ArrayRep::I64:     return i64_data.data();
        case ArrayRep::U8:      return u8_data.data();
        case ArrayRep::F64:     return f64_data.data();
        case ArrayRep::TAFPU:   return tafpu_data.data();
        case ArrayRep::Generic:
        default:                return generic_data.data();
    }
}

const void* ArrayObject::raw_data() const noexcept {
    switch (rep) {
        case ArrayRep::I64:     return i64_data.data();
        case ArrayRep::U8:      return u8_data.data();
        case ArrayRep::F64:     return f64_data.data();
        case ArrayRep::TAFPU:   return tafpu_data.data();
        case ArrayRep::Generic:
        default:                return generic_data.data();
    }
}

std::shared_ptr<ArrayObject> ArrayObject::slice(int64_t start, int64_t count) const {
    size_t sz = size();
    if (start < 0) start += static_cast<int64_t>(sz);
    if (start < 0) start = 0;
    if (start > static_cast<int64_t>(sz)) start = static_cast<int64_t>(sz);
    if (count < 0) count = 0;

    auto result = std::make_shared<ArrayObject>(rep);
    size_t u_start = static_cast<size_t>(start);
    size_t u_end = std::min(sz, u_start + static_cast<size_t>(count));

    switch (rep) {
        case ArrayRep::I64:
            result->i64_data.assign(i64_data.begin() + u_start, i64_data.begin() + u_end);
            break;
        case ArrayRep::U8:
            result->u8_data.assign(u8_data.begin() + u_start, u8_data.begin() + u_end);
            break;
        case ArrayRep::F64:
            result->f64_data.assign(f64_data.begin() + u_start, f64_data.begin() + u_end);
            break;
        case ArrayRep::TAFPU:
            result->tafpu_data.assign(tafpu_data.begin() + u_start, tafpu_data.begin() + u_end);
            break;
        case ArrayRep::Generic:
        default:
            result->generic_data.assign(generic_data.begin() + u_start, generic_data.begin() + u_end);
            break;
    }
    return result;
}

void ArrayObject::sort() {
    switch (rep) {
        case ArrayRep::I64:
            std::sort(i64_data.begin(), i64_data.end());
            break;
        case ArrayRep::U8:
            std::sort(u8_data.begin(), u8_data.end());
            break;
        case ArrayRep::F64:
            std::sort(f64_data.begin(), f64_data.end());
            break;
        case ArrayRep::TAFPU:
            std::sort(tafpu_data.begin(), tafpu_data.end(), [](const TafpuNum& a, const TafpuNum& b) {
                return tafpu_cmp(a, b) < 0;
            });
            break;
        case ArrayRep::Generic:
        default:
            std::sort(generic_data.begin(), generic_data.end(), [](const VMValue& a, const VMValue& b) {
                if (a.is_string() && b.is_string()) return a.to_string() < b.to_string();
                if (a.is_tafpu() && b.is_tafpu()) return tafpu_cmp(a.as_tafpu(), b.as_tafpu()) < 0;
                if (a.is_float() || b.is_float()) return a.as_float() < b.as_float();
                return a.as_int() < b.as_int();
            });
            break;
    }
}

void ArrayObject::reverse() {
    switch (rep) {
        case ArrayRep::I64:   std::reverse(i64_data.begin(), i64_data.end()); break;
        case ArrayRep::U8:    std::reverse(u8_data.begin(), u8_data.end()); break;
        case ArrayRep::F64:   std::reverse(f64_data.begin(), f64_data.end()); break;
        case ArrayRep::TAFPU: std::reverse(tafpu_data.begin(), tafpu_data.end()); break;
        case ArrayRep::Generic:
        default:              std::reverse(generic_data.begin(), generic_data.end()); break;
    }
}

std::string_view array_rep_name(ArrayRep rep) noexcept {
    switch (rep) {
        case ArrayRep::Generic: return "Generic";
        case ArrayRep::I64:     return "I64";
        case ArrayRep::U8:      return "U8";
        case ArrayRep::F64:     return "F64";
        case ArrayRep::TAFPU:   return "TAFPU";
        default:                return "Unknown";
    }
}

} // namespace setun
