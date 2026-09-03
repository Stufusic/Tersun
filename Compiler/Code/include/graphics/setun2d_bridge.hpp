#pragma once

#include <string>
#include <cstdint>
#include <vector>
#include <chrono>

namespace setun::graphics {

class Setun2DBridge {
public:
    static Setun2DBridge& instance();

    bool init(int width, int height, const std::string& title);
    bool is_running();
    void clear(uint32_t rgb);
    void draw_rect(int x, int y, int w, int h, uint32_t rgb);
    void draw_circle(int cx, int cy, int r, uint32_t rgb);
    void draw_text(int x, int y, const std::string& text, uint32_t rgb);
    int flip();
    int get_key();
    void close();

    void set_headless(bool headless) { headless_ = headless; }
    bool is_headless() const { return headless_; }

    ~Setun2DBridge();

private:
    Setun2DBridge() = default;

    bool running_ = false;
    bool headless_ = false;
    int latest_key_ = 0;
    int width_ = 0;
    int height_ = 0;

    std::vector<uint32_t> framebuffer_;
    std::chrono::high_resolution_clock::time_point last_flip_time_;

#if defined(_WIN32)
    void* hwnd_ = nullptr;
    void* hdc_ = nullptr;
    void* mem_dc_ = nullptr;
    void* hbm_ = nullptr;
    void* old_bm_ = nullptr;
    uint32_t* dib_pixels_ = nullptr;
#endif

    void process_window_events();
};

// C API Wrappers for Setun VM & AOT
extern "C" {
    int setun2d_init(int w, int h, const char* title);
    int setun2d_is_running();
    void setun2d_clear(int rgb);
    void setun2d_draw_rect(int x, int y, int w, int h, int rgb);
    void setun2d_draw_circle(int cx, int cy, int r, int rgb);
    void setun2d_draw_text(int x, int y, const char* text, int rgb);
    int setun2d_flip();
    int setun2d_get_key();
    void setun2d_close();
}

} // namespace setun::graphics
