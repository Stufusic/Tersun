#pragma once

#include <stdexcept>
#include <string>

namespace setun {

// Base exception for all Setun/TAFPU runtime errors
class SetunException : public std::runtime_error {
public:
    explicit SetunException(const std::string& msg) : std::runtime_error(msg) {}
};

// TAFPU specific algebraic exception
class TafpuException : public SetunException {
public:
    explicit TafpuException(const std::string& msg) : SetunException(msg) {}
};

// Isotropic Division Exception (A2^2 - 3*B2^2 == 0)
// Dividing by an isotropic element in Q(sqrt(3))
class IsotropicDivisionException : public TafpuException {
public:
    explicit IsotropicDivisionException(const std::string& msg = "Algebraic Exception: Division by isotropic element or zero in Q(sqrt(3)) (A^2 - 3*B^2 == 0)")
        : TafpuException(msg) {}
};

// Integer overflow in TAFPU fixed-width (int64) arithmetic.
// Thrown instead of silent UB when A/B coefficients exceed int64 range (GĐ1).
class TafpuOverflowException : public TafpuException {
public:
    explicit TafpuOverflowException(const std::string& msg = "TAFPU integer overflow: coefficient exceeds int64 range")
        : TafpuException(msg) {}
};

// Inexact exponent alignment (shift_right with A % 3 != 0 would truncate).
// Callers may catch to fall back to a different strategy instead of losing precision.
class TafpuInexactAlignmentException : public TafpuException {
public:
    explicit TafpuInexactAlignmentException(const std::string& msg = "TAFPU inexact alignment: shift_right would truncate (A % 3 != 0)")
        : TafpuException(msg) {}
};

// VM execution exception
class VMException : public SetunException {
public:
    explicit VMException(const std::string& msg) : SetunException(msg) {}
};

// Compiler error exception
class CompilerException : public SetunException {
public:
    explicit CompilerException(const std::string& msg) : SetunException(msg) {}
};

} // namespace setun
