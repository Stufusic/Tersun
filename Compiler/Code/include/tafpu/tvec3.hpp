#pragma once

#include "tafpu/tafpu.hpp"
#include "tafpu/tmat.hpp"
#include <sstream>
#include <cmath>

namespace setun {

// -----------------------------------------------------------------------------
// tvec3: 3D Coordinate Vector in Q(sqrt(3))
// Zero-drift physics and coordinate representation
// -----------------------------------------------------------------------------
struct tvec3 {
    TAF_Register x;
    TAF_Register y;
    TAF_Register z;

    constexpr tvec3() : x(0, 0, 0), y(0, 0, 0), z(0, 0, 0) {}
    constexpr tvec3(const TAF_Register& x_val, const TAF_Register& y_val, const TAF_Register& z_val)
        : x(x_val), y(y_val), z(z_val) {}

    tvec3 operator+(const tvec3& other) const {
        return tvec3(x + other.x, y + other.y, z + other.z);
    }

    tvec3 operator-(const tvec3& other) const {
        return tvec3(x - other.x, y - other.y, z - other.z);
    }

    tvec3 operator*(const TAF_Register& scalar) const {
        return tvec3(x * scalar, y * scalar, z * scalar);
    }

    tvec3 operator-() const {
        return tvec3(-x, -y, -z);
    }

    bool operator==(const tvec3& other) const {
        return x == other.x && y == other.y && z == other.z;
    }

    bool operator!=(const tvec3& other) const {
        return !(*this == other);
    }

    // Dot product: v1 . v2
    TAF_Register dot(const tvec3& other) const {
        return (x * other.x) + (y * other.y) + (z * other.z);
    }

    // Cross product: v1 x v2
    tvec3 cross(const tvec3& other) const {
        return tvec3(
            (y * other.z) - (z * other.y),
            (z * other.x) - (x * other.z),
            (x * other.y) - (y * other.x)
        );
    }

    // Euclidean Distance Squared: d^2 = dx^2 + dy^2 + dz^2 (0% error)
    TAF_Register dist_squared(const tvec3& other) const {
        TAF_Register dx = x - other.x;
        TAF_Register dy = y - other.y;
        TAF_Register dz = z - other.z;
        return (dx * dx) + (dy * dy) + (dz * dz);
    }

    // Transform by AffineTransform4x4
    tvec3 transform(const AffineTransform4x4& affine) const {
        const auto& m = affine.matrix;
        TAF_Register one(1, 0, 0);
        TAF_Register nx = (m(0, 0) * x) + (m(0, 1) * y) + (m(0, 2) * z) + (m(0, 3) * one);
        TAF_Register ny = (m(1, 0) * x) + (m(1, 1) * y) + (m(1, 2) * z) + (m(1, 3) * one);
        TAF_Register nz = (m(2, 0) * x) + (m(2, 1) * y) + (m(2, 2) * z) + (m(2, 3) * one);
        return tvec3(nx, ny, nz);
    }

    std::string to_string() const {
        std::ostringstream oss;
        oss << "tvec3(" << x.to_string(false) << ", " << y.to_string(false) << ", " << z.to_string(false) << ")";
        return oss.str();
    }
};

// -----------------------------------------------------------------------------
// 3-Way Geometric Orientation Test:
// Tests position of point P relative to plane (defined by normal N and point Q):
// Returns: +1 (In front / positive halfspace), 0 (On plane), -1 (Behind / negative halfspace)
// Guaranteed exact with 0 jitter because all arithmetic is integer-based in Q(sqrt(3))!
// -----------------------------------------------------------------------------
inline int orientation_test_3way(const tvec3& P, const tvec3& plane_point_Q, const tvec3& plane_normal_N) {
    tvec3 diff = P - plane_point_Q;
    TAF_Register signed_dist = diff.dot(plane_normal_N);
    return tafpu_cmp(signed_dist, TAF_Register(0, 0, 0));
}

// -----------------------------------------------------------------------------
// SAT (Separating Axis Theorem) 1D Projection overlap check
// -----------------------------------------------------------------------------
inline bool sat_intervals_overlap(
    const TAF_Register& min_a, const TAF_Register& max_a,
    const TAF_Register& min_b, const TAF_Register& max_b
) {
    // Overlap if min_a <= max_b and min_b <= max_a
    return (tafpu_cmp(min_a, max_b) <= 0) && (tafpu_cmp(min_b, max_a) <= 0);
}

// -----------------------------------------------------------------------------
// Zero-Drift Physics Particle Integrator
// Updates position: x(t + dt) = x(t) + v * dt + 0.5 * a * dt^2
// -----------------------------------------------------------------------------
struct ExactPhysicsBody {
    tvec3 position;
    tvec3 velocity;
    tvec3 acceleration;

    ExactPhysicsBody(const tvec3& pos = {}, const tvec3& vel = {}, const tvec3& acc = {})
        : position(pos), velocity(vel), acceleration(acc) {}

    void step(const TAF_Register& dt) {
        // v = v + a * dt
        velocity = velocity + (acceleration * dt);
        // pos = pos + v * dt
        position = position + (velocity * dt);
    }
};

} // namespace setun
