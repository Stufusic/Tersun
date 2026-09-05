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
    void draw_line(int x1, int y1, int x2, int y2, uint32_t rgb);
    void draw_text(int x, int y, const std::string& text, uint32_t rgb);
    int text_width(const std::string& text); // pixel width via GDI (W API)
    int flip();
    int get_key();
    void close();

    // Mouse Query & Interaction (Canvas Client Coordinates)
    int get_mouse_x() const { return mouse_x_; }
    int get_mouse_y() const { return mouse_y_; }
    int get_mouse_btn() const { return mouse_last_btn_; }
    bool is_mouse_down(int btn) const;
    void set_mouse_pos(int client_x, int client_y);
    void mouse_click(int btn, int client_x, int client_y);

    // Keyboard Text Input & Key States (Tersun 1.0.3)
    int get_char();
    bool is_key_down(int vk_code) const {
        if (vk_code >= 0 && vk_code < 256) {
            return keys_down_[vk_code];
        }
        return false;
    }

    // Mouse Wheel (Tersun 1.0.3+)
    int get_wheel_delta() {
        int d = wheel_delta_;
        wheel_delta_ = 0;
        return d;
    }

    // Native File Dialogs (Windows Common Dialogs)
    std::string file_dialog_save(const std::string& filter, const std::string& default_ext);
    std::string file_dialog_open(const std::string& filter);

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

    int mouse_x_ = 0;
    int mouse_y_ = 0;
    bool mouse_left_down_ = false;
    bool mouse_left_clicked_latched_ = false;
    bool mouse_mid_down_ = false;
    bool mouse_mid_clicked_latched_ = false;
    bool mouse_right_down_ = false;
    bool mouse_right_clicked_latched_ = false;
    int mouse_last_btn_ = 99;
    int wheel_delta_ = 0;

    std::vector<uint32_t> framebuffer_;
    std::chrono::high_resolution_clock::time_point last_flip_time_;

#if defined(_WIN32)
    void* hwnd_ = nullptr;
    void* font_ = nullptr;      // Unicode UI font (Segoe UI)
    void* old_font_ = nullptr;
    uint32_t pending_surrogate_ = 0; // high surrogate awaiting its pair
    void* hdc_ = nullptr;
    void* mem_dc_ = nullptr;
    void* hbm_ = nullptr;
    void* old_bm_ = nullptr;
    uint32_t* dib_pixels_ = nullptr;
#endif

    std::vector<int> char_queue_;
    bool keys_down_[256] = { false };

    void process_window_events();
};

// C API Wrappers for Setun VM & AOT
extern "C" {
    int setun2d_init(int w, int h, const char* title);
    int setun2d_is_running();
    void setun2d_clear(int rgb);
    void setun2d_draw_rect(int x, int y, int w, int h, int rgb);
    void setun2d_draw_circle(int cx, int cy, int r, int rgb);
    void setun2d_draw_line(int x1, int y1, int x2, int y2, int rgb);
    void setun2d_draw_text(int x, int y, const char* text, int rgb);
    int setun2d_text_width(const char* text);
    int setun2d_flip();
    int setun2d_get_key();
    void setun2d_close();

    // Mouse C API (Tersun 1.0.2 Native Host Extension)
    int setun2d_get_mouse_x();
    int setun2d_get_mouse_y();
    int setun2d_get_mouse_btn();
    int setun2d_is_mouse_down(int btn);
    void setun2d_set_mouse_pos(int x, int y);
    void setun2d_mouse_click(int btn, int x, int y);
    int setun2d_get_wheel();

    // Keyboard C API (Tersun 1.0.3 Native Host Extension)
    int setun2d_get_char();
    int setun2d_is_key_down(int vk_code);

    // Native Dialogs
    const char* setun2d_file_dialog_save(const char* filter, const char* def_ext);
    const char* setun2d_file_dialog_open(const char* filter);
}

} // namespace setun::graphics
