#pragma once

#include "tafpu/tvec3.hpp"

namespace setun {

// -----------------------------------------------------------------------------
// tquat: Ternary Algebraic Quaternion in Q(sqrt(3))
// q = w + x*i + y*j + z*k
// -----------------------------------------------------------------------------
struct tquat {
    TAF_Register w;
    TAF_Register x;
    TAF_Register y;
    TAF_Register z;

    constexpr tquat() : w(1, 0, 0), x(0, 0, 0), y(0, 0, 0), z(0, 0, 0) {}
    constexpr tquat(const TAF_Register& w_val, const TAF_Register& x_val, const TAF_Register& y_val, const TAF_Register& z_val)
        : w(w_val), x(x_val), y(y_val), z(z_val) {}

    static tquat identity() {
        return tquat(TAF_Register(1, 0, 0), TAF_Register(0, 0, 0), TAF_Register(0, 0, 0), TAF_Register(0, 0, 0));
    }

    tquat conjugate() const {
        return tquat(w, -x, -y, -z);
    }

    TAF_Register norm_squared() const {
        return (w * w) + (x * x) + (y * y) + (z * z);
    }

    // Quaternion multiplication: Hamilton product
    tquat operator*(const tquat& q) const {
        return tquat(
            (w * q.w) - (x * q.x) - (y * q.y) - (z * q.z),
            (w * q.x) + (x * q.w) + (y * q.z) - (z * q.y),
            (w * q.y) - (x * q.z) + (y * q.w) + (z * q.x),
            (w * q.z) + (x * q.y) - (y * q.x) + (z * q.w)
        );
    }

    // Rotate 3D vector v: v' = q * (0, v) * conjugate(q)
    tvec3 rotate(const tvec3& v) const {
        tquat qv(TAF_Register(0, 0, 0), v.x, v.y, v.z);
        tquat rotated = (*this) * qv * conjugate();
        return tvec3(rotated.x, rotated.y, rotated.z);
    }

    std::string to_string() const {
        std::ostringstream oss;
        oss << "tquat(" << w.to_string(false) << ", " << x.to_string(false) << ", "
            << y.to_string(false) << ", " << z.to_string(false) << ")";
        return oss.str();
    }
};

} // namespace setun
