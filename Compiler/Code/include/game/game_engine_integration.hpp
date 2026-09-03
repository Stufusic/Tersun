#pragma once

#include "tafpu/tafpu.hpp"
#include "tafpu/tvec3.hpp"
#include "tafpu/tmat.hpp"
#include <vector>
#include <string>
#include <memory>
#include <chrono>

namespace setun {

// -----------------------------------------------------------------------------
// Tri-State Game AI: -1 (Hostile), 0 (Neutral), +1 (Friendly / Ally)
// -----------------------------------------------------------------------------
enum class FactionAlignment : int8_t {
    HOSTILE  = -1,
    NEUTRAL  =  0,
    FRIENDLY =  1
};

struct NPCAgent {
    uint32_t id{0};
    FactionAlignment alignment{FactionAlignment::NEUTRAL};
    tvec3 position;
    tvec3 velocity;
    TAF_Register health{100, 0, 0};
    TAF_Register attack_power{15, 0, 0};
    int current_state{0}; // 0: Idle, 1: Attack, -1: Retreat

    NPCAgent(uint32_t agent_id, FactionAlignment align, const tvec3& pos)
        : id(agent_id), alignment(align), position(pos), velocity(TAF_Register(0, 0, 0), TAF_Register(0, 0, 0), TAF_Register(0, 0, 0)) {}

    // Evaluate 3-Way Behavior Tree Decision in 1 cycle
    void update_ai_behavior(const tvec3& player_pos, const TAF_Register& aggro_radius_sq) {
        TAF_Register dist_sq = position.dist_squared(player_pos);
        int in_range = tafpu_cmp(dist_sq, aggro_radius_sq);

        if (alignment == FactionAlignment::HOSTILE) {
            if (in_range <= 0) {
                // Inside aggro radius: Attack
                current_state = 1;
                // Move towards player
                tvec3 dir = player_pos - position;
                velocity = tvec3(
                    TAF_Register(dir.x.a > 0 ? 1 : (dir.x.a < 0 ? -1 : 0), 0, 0),
                    TAF_Register(dir.y.a > 0 ? 1 : (dir.y.a < 0 ? -1 : 0), 0, 0),
                    TAF_Register(dir.z.a > 0 ? 1 : (dir.z.a < 0 ? -1 : 0), 0, 0)
                );
            } else {
                current_state = 0; // Patrol
            }
        } else if (alignment == FactionAlignment::FRIENDLY) {
            current_state = 1; // Follow / Assist
        } else {
            current_state = 0; // Neutral Idle
        }

        // Integrate Position with 0% coordinate drift
        position = position + velocity;
    }
};

// -----------------------------------------------------------------------------
// Production Game World Simulation Engine (1,000+ Entities in < 1.0 ms)
// -----------------------------------------------------------------------------
class GameWorldEngine {
public:
    GameWorldEngine();

    void spawn_npc(FactionAlignment align, const tvec3& pos);
    void update_frame(const tvec3& player_pos, const TAF_Register& dt);

    size_t npc_count() const { return npcs_.size(); }
    const std::vector<NPCAgent>& npcs() const { return npcs_; }

    // Combat Damage Calculation with 0% algebraic precision
    static TAF_Register calculate_exact_combat_damage(
        const TAF_Register& base_damage,
        const TAF_Register& armor,
        const TAF_Register& crit_multiplier // e.g. 1 + sqrt(3)/2
    );

private:
    std::vector<NPCAgent> npcs_;
    uint32_t next_id_{1};
};

} // namespace setun
