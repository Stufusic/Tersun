#include "game/game_engine_integration.hpp"
#include <algorithm>

namespace setun {

GameWorldEngine::GameWorldEngine() = default;

void GameWorldEngine::spawn_npc(FactionAlignment align, const tvec3& pos) {
    npcs_.emplace_back(next_id_++, align, pos);
}

void GameWorldEngine::update_frame(const tvec3& player_pos, const TAF_Register& dt) {
    (void)dt;
    TAF_Register aggro_radius_sq(2500, 0, 0); // 50^2 = 2500 distance squared

    for (auto& npc : npcs_) {
        npc.update_ai_behavior(player_pos, aggro_radius_sq);
    }
}

TAF_Register GameWorldEngine::calculate_exact_combat_damage(
    const TAF_Register& base_damage,
    const TAF_Register& armor,
    const TAF_Register& crit_multiplier
) {
    // Formula: Damage = max(1, (Base - Armor * 0.5)) * CritMultiplier
    TAF_Register half_armor = armor / TAF_Register(2, 0, 0);
    TAF_Register net_base = base_damage - half_armor;
    if (tafpu_cmp(net_base, TAF_Register(1, 0, 0)) < 0) {
        net_base = TAF_Register(1, 0, 0);
    }
    return net_base * crit_multiplier;
}

} // namespace setun
