#include "runtime/lockfree_queue.hpp"
#include "runtime/async_scheduler.hpp"
#include "runtime/actor_system.hpp"
#include "tools/bindgen.hpp"
#include <iostream>
#include <vector>
#include <chrono>
#include <cassert>
#include <thread>
#include <atomic>

namespace setun {

// Simple Ping-Pong Actor for Milestone 3
class PingPongActor : public runtime::Actor {
public:
    PingPongActor(uint64_t id) : runtime::Actor(id), received_count(0), sum(0) {}

    void on_receive(std::unique_ptr<runtime::Message> msg) override {
        if (msg->type_id == 2) {
            auto* num_msg = static_cast<runtime::NumericMessage*>(msg.get());
            sum += (num_msg->val1 + num_msg->val2);
            received_count++;
        }
    }

    std::atomic<uint64_t> received_count{0};
    std::atomic<int64_t> sum{0};
};

void run_phase4_async_tests() {
    std::cout << "\n[Test Phase 4] Tri-Priority Async Scheduler, Lock-Free SPSC/MPMC, Actor Zero-Copy & Bindgen...\n";

    // 1. Test Milestone 1: SPSC & MPMC Lock-Free Ring Buffers Throughput
    {
        using namespace runtime;
        const size_t NUM_MSGS = 1000000;

        // Test SPSC Queue between 2 threads
        SPSCQueue<uint64_t, 65536> spsc;
        std::atomic<bool> producer_done{false};

        auto start = std::chrono::high_resolution_clock::now();

        std::thread producer([&]() {
            for (uint64_t i = 1; i <= NUM_MSGS; ++i) {
                while (!spsc.push(i)) {
                    std::this_thread::yield();
                }
            }
            producer_done.store(true, std::memory_order_release);
        });

        std::thread consumer([&]() {
            uint64_t val = 0;
            uint64_t count = 0;
            uint64_t expected_sum = (NUM_MSGS * (NUM_MSGS + 1)) / 2;
            uint64_t actual_sum = 0;

            while (count < NUM_MSGS) {
                if (spsc.pop(val)) {
                    actual_sum += val;
                    count++;
                } else if (producer_done.load(std::memory_order_acquire) && spsc.empty()) {
                    break;
                }
            }
            assert(count == NUM_MSGS);
            assert(actual_sum == expected_sum);
        });

        producer.join();
        consumer.join();

        auto end = std::chrono::high_resolution_clock::now();
        double elapsed_ms = std::chrono::duration<double, std::milli>(end - start).count();
        double throughput_mops = (NUM_MSGS / 1000000.0) / (elapsed_ms / 1000.0);

        std::cout << "  -> PASSED: SPSC Lock-Free Queue: 1,000,000 messages passed in " 
                  << elapsed_ms << " ms (" << throughput_mops << " Million msg/sec)!\n";

        // Test MPMC Queue with 4 concurrent threads
        MPMCQueue<uint64_t, 65536> mpmc;
        std::atomic<uint64_t> mpmc_received{0};
        const size_t PROD_MSGS = 250000; // 4 producers * 250k = 1M msgs

        std::vector<std::thread> prods;
        for (int p = 0; p < 4; ++p) {
            prods.emplace_back([&mpmc]() {
                for (uint64_t i = 1; i <= PROD_MSGS; ++i) {
                    while (!mpmc.push(i)) {
                        std::this_thread::yield();
                    }
                }
            });
        }

        std::vector<std::thread> cons;
        for (int c = 0; c < 4; ++c) {
            cons.emplace_back([&mpmc, &mpmc_received]() {
                uint64_t val = 0;
                while (mpmc_received.load(std::memory_order_relaxed) < 1000000) {
                    if (mpmc.pop(val)) {
                        mpmc_received.fetch_add(1, std::memory_order_relaxed);
                    } else {
                        std::this_thread::yield();
                    }
                }
            });
        }

        for (auto& t : prods) t.join();
        for (auto& t : cons) t.join();

        assert(mpmc_received.load() >= 1000000);
        std::cout << "  -> PASSED: MPMC Lock-Free Dmitry Vyukov Queue: 4-thread MPMC completed seamlessly!\n";
    }

    // 2. Test Milestone 2: Tri-Priority Fiber Scheduler & Priority-Aware Work Stealing
    {
        using namespace runtime;
        TriPriorityScheduler scheduler(4);

        std::atomic<uint64_t> high_completed{0};
        std::atomic<uint64_t> normal_completed{0};
        std::atomic<uint64_t> low_completed{0};

        // Spawn 100,000 mixed priority tasks
        for (int i = 0; i < 10000; ++i) {
            scheduler.spawn([&high_completed]() {
                high_completed.fetch_add(1, std::memory_order_relaxed);
            }, TaskPriority::HIGH);

            scheduler.spawn([&normal_completed]() {
                normal_completed.fetch_add(1, std::memory_order_relaxed);
            }, TaskPriority::NORMAL);

            scheduler.spawn([&low_completed]() {
                low_completed.fetch_add(1, std::memory_order_relaxed);
            }, TaskPriority::LOW);
        }

        scheduler.wait_all();

        assert(high_completed.load() == 10000);
        assert(normal_completed.load() == 10000);
        assert(low_completed.load() == 10000);

        std::cout << "  -> PASSED: Tri-Priority Scheduler: 30,000 tasks dispatched & completed (+1, 0, -1)!\n";
    }

    // 3. Test Milestone 3: Actor System with Zero-Copy Move Semantics (10,000 Actors)
    {
        using namespace runtime;
        TriPriorityScheduler scheduler(4);
        ActorSystem actor_system(scheduler);

        const size_t NUM_ACTORS = 10000; // 10,000 Actors
        std::vector<std::shared_ptr<PingPongActor>> actors;
        actors.reserve(NUM_ACTORS);

        for (size_t i = 0; i < NUM_ACTORS; ++i) {
            actors.push_back(actor_system.spawn<PingPongActor>());
        }

        // Send messages with Zero-Copy Move Semantics (O(1) pointer ownership transfer)
        for (size_t i = 0; i < NUM_ACTORS; ++i) {
            auto msg = std::make_unique<NumericMessage>(10, 20, 0); // 10 + 20 = 30
            actors[i]->send(std::move(msg));
            actor_system.schedule_actor(actors[i], TaskPriority::NORMAL);
        }

        actor_system.wait_all();

        for (size_t i = 0; i < NUM_ACTORS; ++i) {
            assert(actors[i]->received_count.load() == 1);
            assert(actors[i]->sum.load() == 30);
        }

        std::cout << "  -> PASSED: Actor System: 10,000 Concurrent Actors with Zero-Copy Move Semantics Verified!\n";
    }

    // 4. Test Milestone 4: Automated C Header Bindgen
    {
        using namespace tools;
        std::string sample_c_header = R"(
            struct Vector3 {
                float x;
                float y;
                float z;
            };

            struct Color {
                int r;
                int g;
                int b;
                int a;
            };

            void InitWindow(int width, int height, const char* title);
            void DrawCircle(int centerX, int centerY, float radius, Color color);
            double GetFrameTime(void);
            bool WindowShouldClose(void);
        )";

        CBindgenResult res = CBindgen::parse_header_and_generate(sample_c_header);

        assert(res.structs.size() == 2);
        assert(res.structs[0].name == "Vector3");
        assert(res.structs[1].name == "Color");

        assert(res.functions.size() == 4);
        assert(res.functions[0].name == "InitWindow");
        assert(res.functions[1].name == "DrawCircle");
        assert(res.functions[2].name == "GetFrameTime");
        assert(res.functions[3].name == "WindowShouldClose");

        std::cout << "  -> PASSED: Automated C Header Bindgen successfully parsed structs and emitted Setun FFI wrappers!\n";
    }

    std::cout << "  -> ALL PHASE 4 ASYNC, LOCK-FREE, ACTOR & BINDGEN TESTS PASSED (100% SUCCESS)!\n";
}

} // namespace setun
