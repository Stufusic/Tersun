// ==============================================================================
// Tersun Gate 6 Rebuild (G6R) Parametric TOS Cache Explicit Instantiations
// ==============================================================================

#include "vm/tos_cache.hpp"

namespace setun {

// Explicit template instantiations for N in {0, 1, 2, 3, 4}
template class TOSCache<0>;
template class TOSCache<1>;
template class TOSCache<2>;
template class TOSCache<3>;
template class TOSCache<4>;

} // namespace setun
