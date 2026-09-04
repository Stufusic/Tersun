#include "qvm/qreg.hpp"
#include <iomanip>
#include <sstream>

namespace tersun {
namespace qvm {

QubitRegister::QubitRegister(size_t num_qubits)
    : num_qubits_(num_qubits) {
    size_t words = (num_qubits + 31) / 32;
    packed_words_.resize(words ? words : 1);
    reset();
}

void QubitRegister::reset() {
    for (auto& w : packed_words_) {
        w.raw = 0; // All in state |0> (ZERO)
    }
    statevector_active_ = false;
    state_vector_.clear();
}

QubitState2Bit QubitRegister::get_discrete_state(size_t q) const {
    if (q >= num_qubits_) return QubitState2Bit::PLUS_OR_NIL;
    size_t word_idx = q / 32;
    size_t bit_idx = q % 32;
    return packed_words_[word_idx].get(bit_idx);
}

void QubitRegister::set_discrete_state(size_t q, QubitState2Bit state) {
    if (q >= num_qubits_) return;
    size_t word_idx = q / 32;
    size_t bit_idx = q % 32;
    packed_words_[word_idx].set(bit_idx, state);
}

void QubitRegister::pack_2bits(size_t q, uint8_t two_bits) {
    set_discrete_state(q, static_cast<QubitState2Bit>(two_bits & 0x03));
}

uint8_t QubitRegister::unpack_2bits(size_t q) {
    return static_cast<uint8_t>(get_discrete_state(q));
}

void QubitRegister::promote_to_statevector() {
    if (statevector_active_) return;

    size_t dim = 1ULL << num_qubits_;
    state_vector_.assign(dim, QComplex(0.0, 0.0));

    // Initialize statevector as tensor product of the discrete states
    // Start with 1-qubit base: q0
    std::vector<QComplex> current = {QComplex(1.0, 0.0)}; // |> scalar

    const double inv_sqrt2 = 1.0 / std::sqrt(2.0);

    for (size_t q = 0; q < num_qubits_; ++q) {
        QubitState2Bit s = get_discrete_state(q);
        QComplex a0, a1;
        switch (s) {
            case QubitState2Bit::ZERO:
                a0 = QComplex(1.0, 0.0);
                a1 = QComplex(0.0, 0.0);
                break;
            case QubitState2Bit::ONE:
                a0 = QComplex(0.0, 0.0);
                a1 = QComplex(1.0, 0.0);
                break;
            case QubitState2Bit::MINUS:
                a0 = QComplex(inv_sqrt2, 0.0);
                a1 = QComplex(-inv_sqrt2, 0.0);
                break;
            case QubitState2Bit::PLUS_OR_NIL:
            default:
                a0 = QComplex(inv_sqrt2, 0.0);
                a1 = QComplex(inv_sqrt2, 0.0);
                break;
        }

        // Tensor product: qubit q at bit position q (cur_size = 1 << q)
        size_t cur_size = current.size();
        std::vector<QComplex> next(cur_size * 2);
        for (size_t i = 0; i < cur_size; ++i) {
            next[i]            = current[i] * a0;
            next[i + cur_size] = current[i] * a1;
        }
        current = std::move(next);
    }

    state_vector_ = std::move(current);
    statevector_active_ = true;
}

double QubitRegister::prob1(size_t q) const {
    if (q >= num_qubits_) return 0.0;

    if (!statevector_active_) {
        QubitState2Bit s = get_discrete_state(q);
        if (s == QubitState2Bit::ONE) return 1.0;
        if (s == QubitState2Bit::ZERO) return 0.0;
        return 0.5; // MINUS or PLUS has 50% probability of 1
    }

    double p1 = 0.0;
    size_t dim = state_vector_.size();
    for (size_t i = 0; i < dim; ++i) {
        if ((i >> q) & 1ULL) {
            p1 += std::norm(state_vector_[i]);
        }
    }
    return p1;
}

int QubitRegister::measure(size_t q) {
    if (q >= num_qubits_) return 0;

    double p1 = prob1(q);
    std::uniform_real_distribution<double> dist(0.0, 1.0);
    double r = dist(get_rng());
    int outcome = (r < p1) ? 1 : 0;

    if (statevector_active_) {
        double prob_outcome = (outcome == 1) ? p1 : (1.0 - p1);
        if (prob_outcome > 1e-15) {
            double norm_factor = 1.0 / std::sqrt(prob_outcome);
            size_t dim = state_vector_.size();
            for (size_t i = 0; i < dim; ++i) {
                if (((i >> q) & 1ULL) == static_cast<size_t>(outcome)) {
                    state_vector_[i] *= norm_factor;
                } else {
                    state_vector_[i] = QComplex(0.0, 0.0);
                }
            }
        }
    }

    set_discrete_state(q, (outcome == 1) ? QubitState2Bit::ONE : QubitState2Bit::ZERO);
    return outcome;
}

int QubitRegister::measure_trit(size_t q) {
    if (q >= num_qubits_) return 0;

    QubitState2Bit s = get_discrete_state(q);
    if (!statevector_active_) {
        switch (s) {
            case QubitState2Bit::ZERO: return 0;
            case QubitState2Bit::ONE: return 1;
            case QubitState2Bit::MINUS: return -1;
            case QubitState2Bit::PLUS_OR_NIL: {
                int bit = measure(q);
                return (bit == 1) ? 1 : -1;
            }
        }
    }

    // From statevector, project to 3-way trit
    int bit = measure(q);
    return (bit == 1) ? 1 : 0;
}

std::vector<int> QubitRegister::measure_all() {
    std::vector<int> results(num_qubits_);
    for (size_t q = 0; q < num_qubits_; ++q) {
        results[q] = measure(q);
    }
    return results;
}

void QubitRegister::dump_state(std::ostream& os) const {
    os << "=== Qubit Register (" << num_qubits_ << " Qubits) ===\n";
    for (size_t q = 0; q < num_qubits_; ++q) {
        os << "  Q[" << q << "]: " << qubit_state_to_str(get_discrete_state(q))
           << " (P(1)=" << std::fixed << std::setprecision(3) << prob1(q) << ")\n";
    }
    if (statevector_active_) {
        os << "  StateVector Amplitudes:\n";
        size_t limit = std::min<size_t>(state_vector_.size(), 16);
        for (size_t i = 0; i < limit; ++i) {
            double mag = std::norm(state_vector_[i]);
            if (mag > 1e-4) {
                os << "    |" << i << "> : " << state_vector_[i]
                   << " (prob=" << std::setprecision(4) << mag << ")\n";
            }
        }
    }
    os << "========================================\n";
}

} // namespace qvm
} // namespace tersun
