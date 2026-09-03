# Kế Hoạch Triển Khai Chi Tiết: Phase 4 - Bộ Đồng Thời Tam Phân (Tri-Priority async/await), Lock-Free SPSC/MPMC, Actor Zero-Copy & C Bindgen
## *Phân tách SPSC & MPMC • Priority-Aware Work Stealing • Actor Zero-Copy • Tự động sinh C FFI Wrapper*

---

## 1. Mục Tiêu Cốt Lõi Của Phase 4
Tối ưu hóa kiến trúc đa luồng và mở rộng hệ sinh thái Setun 2.0 theo 4 giải pháp chuyên sâu:

1. **Phân Tách Rõ Ràng Hàng Đợi SPSC & MPMC (Specialized Lock-Free Queues)**:
   - **`SPSCQueue<T, Capacity>` (Single-Producer Single-Consumer)**: Thiết kế vòng tròn siêu nhẹ, không có atomic contention, căn lề Cache Line 64-byte để truyền tin giữa 2 luồng cố định với độ trễ $\le 3\text{ ns/msg}$.
   - **`MPMCQueue<T, Capacity>` (Multi-Producer Multi-Consumer)**: Sử dụng thuật toán Dmitry Vyukov Sequence Bounded Queue với atomic monotonic counters, giải quyết triệt để bài toán ABA và đảm bảo an toàn bộ nhớ tuyệt đối khi hàng nghìn Actor gửi tin nhắn đồng thời vào 1 Mailbox (thông lượng $\ge 50,000,000\text{ msg/s}$).
2. **Priority-Aware Work-Stealing (Chống Ô Nhiễm Bộ Nhớ Đệm Cache Pollution)**:
   - Lõi (Worker thread) đang phụ trách luồng thời gian thực **`HIGH (+1)`** chỉ được phép đánh cắp task từ hàng đợi `HIGH` hoặc `NORMAL` của core khác; **TUYỆT ĐỐI CẤM đánh cắp task `LOW (-1)`** (I/O, Garbage Collection, Streaming assets) để tránh làm bẩn L1/L2 cache, đảm bảo chu kỳ tick 120+ FPS luôn ổn định.
   - Khi rảnh rỗi, lõi `HIGH` sẽ thực hiện lệnh `_mm_pause()` / spin-wait cực ngắn để đón nhận frame vật lý tiếp theo với độ trễ $0\text{ns}$.
3. **Actor Model Zero-Copy Move Semantics (O(1) Message Transfer)**:
   - Toàn bộ thông điệp giữa các Actor được truyền thông qua ngữ nghĩa di chuyển quyền sở hữu độc quyền (**Move Semantics / `std::unique_ptr`**).
   - Chi phí chuyển giao tin nhắn là $O(1)$ (chỉ hoán đổi 1 con trỏ 8-byte), loại bỏ hoàn toàn Deep Copy, bảo toàn nguyên lý **Zero Shared Mutable State** và duy trì độ trễ $\le 10\text{ ns}$ ngay cả khi chạy $10,000$ Actors song song.
4. **Bộ Phân Tích C Header & Tự Động Sinh FFI Bindings (`setunc bindgen`)**:
   - Xây dựng bộ quét header C/C++ chuẩn xử lý trọn vẹn macro, typedef, struct và hàm con trỏ.
   - Tự động sinh mã Setun 2.0 Wrapper tương thích hoàn toàn chuẩn C ABI (`extern "C"`) cho phép gọi trực tiếp **Raylib, SDL2, OpenGL, Vulkan, OpenCV**.

---

## 2. Thiết Kế Kiến Trúc Lập Lịch & Đồng Thời Phase 4

```
                       TRI-PRIORITY ASYNC TASK DISPATCHER
                                       │
            ┌──────────────────────────┼──────────────────────────┐
            ▼                          ▼                          ▼
     [+1] HIGH QUEUE            [0] NORMAL QUEUE           [-1] LOW QUEUE
  (Physics 120+ FPS Tick)       (NPC AI / Gameplay)     (I/O, Streaming, GC)
            │                          │                          │
            └────────────┬─────────────┴──────────────────────────┘
                         │
                         ▼
        ┌──────────────────────────────────────────────────┐
        │        PRIORITY-AWARE WORK-STEALING POOL         │
        │  - High Core ONLY steals HIGH/NORMAL (No Cache)  │
        │  - Low Core handles background I/O & Memory Pack │
        └────────────────────────┬─────────────────────────┘
                                 │
                 Zero-Copy Move Semantics (O(1))
                                 │
                                 ▼
        ┌──────────────────────────────────────────────────┐
        │          LOCK-FREE SPSC & MPMC MAILBOXES         │
        │  - SPSCQueue: Dedicated 2-thread link (<= 3ns)   │
        │  - MPMCQueue: Actor Multi-sender (50M+ msg/sec)  │
        └──────────────────────────────────────────────────┘
```

---

## 3. Lộ Trình 4 Bước Triển Khai

### Bước 1: Xây Dựng Hàng Đợi Lock-Free Phân Tách SPSC & MPMC ([`lockfree_queue.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/runtime/lockfree_queue.hpp))
- `SPSCQueue`: Hàng đợi 2 luồng $\le 3\text{ ns}$.
- `MPMCQueue`: Hàng đợi đa luồng đa Actor $\ge 50\text{M msg/sec}$.

### Bước 2: Xây Dựng Bộ Lập Lịch Priority-Aware Fiber Scheduler ([`async_scheduler.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/runtime/async_scheduler.hpp))
- Lập lịch 3 mức ưu tiên $+1, 0, -1$.
- Thuật toán Work-Stealing ngăn ngừa Cache Pollution trên lõi HIGH.

### Bước 3: Xây Dựng Hệ Thống Actor Zero-Copy Move Semantics ([`actor_system.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/runtime/actor_system.hpp))
- Hỗ trợ $10,000$ Actors hoạt động đồng thời với chuyển giao con trỏ $O(1)$.

### Bước 4: Xây Dựng Bộ FFI Bindgen & Test Suite ([`bindgen.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/tools/bindgen.hpp) & [`test_phase4_async.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/tests/test_phase4_async.cpp))
- Quét header C, sinh code Wrapper Setun FFI.
- Kiểm thử toàn diện và tích hợp vào `setunc test`.
