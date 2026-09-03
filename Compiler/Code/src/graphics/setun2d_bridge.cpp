#include "graphics/setun2d_bridge.hpp"

#include <iostream>
#include <vector>
#include <chrono>
#include <thread>
#include <algorithm>
#include <cstring>
#include <cmath>

#if defined(_WIN32)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#endif

namespace setun::graphics {

#if defined(_WIN32)
static LRESULT CALLBACK Setun2DWndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam) {
    switch (msg) {
        case WM_CLOSE:
        case WM_DESTROY:
            PostQuitMessage(0);
            return 0;
        case WM_ERASEBKGND:
            return 1; // Prevent background flicker (double-buffering handles it)
        default:
            return DefWindowProcA(hwnd, msg, wParam, lParam);
    }
}
#endif

Setun2DBridge& Setun2DBridge::instance() {
    static Setun2DBridge bridge;
    return bridge;
}

bool Setun2DBridge::init(int width, int height, const std::string& title) {
    if (running_) return true;

    width_ = width;
    height_ = height;
    last_flip_time_ = std::chrono::high_resolution_clock::now();

    if (headless_ || std::getenv("SETUN_HEADLESS")) {
        headless_ = true;
        running_ = true;
        return true;
    }

#if defined(_WIN32)
    HINSTANCE hInstance = GetModuleHandleA(NULL);

    WNDCLASSEXA wc;
    ZeroMemory(&wc, sizeof(wc));
    wc.cbSize = sizeof(WNDCLASSEXA);
    wc.style = CS_HREDRAW | CS_VREDRAW | CS_OWNDC;
    wc.lpfnWndProc = Setun2DWndProc;
    wc.hInstance = hInstance;
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)GetStockObject(BLACK_BRUSH);
    wc.lpszClassName = "Setun2DNativeWindowClass";

    RegisterClassExA(&wc);

    // Adjust window size so client area matches exact width x height
    RECT r = { 0, 0, width, height };
    DWORD dwStyle = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_MINIMIZEBOX;
    AdjustWindowRect(&r, dwStyle, FALSE);

    int win_w = r.right - r.left;
    int win_h = r.bottom - r.top;
    int screen_w = GetSystemMetrics(SM_CXSCREEN);
    int screen_h = GetSystemMetrics(SM_CYSCREEN);
    int pos_x = (screen_w - win_w) / 2;
    int pos_y = (screen_h - win_h) / 2;

    HWND hwnd = CreateWindowExA(
        0,
        "Setun2DNativeWindowClass",
        title.c_str(),
        dwStyle,
        pos_x, pos_y, win_w, win_h,
        NULL, NULL, hInstance, NULL
    );

    if (!hwnd) {
        headless_ = true;
        running_ = true;
        return true;
    }

    ShowWindow(hwnd, SW_SHOW);
    UpdateWindow(hwnd);

    HDC hdc = GetDC(hwnd);
    HDC mem_dc = CreateCompatibleDC(hdc);

    BITMAPINFO bmi;
    ZeroMemory(&bmi, sizeof(BITMAPINFO));
    bmi.bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
    bmi.bmiHeader.biWidth = width;
    bmi.bmiHeader.biHeight = -height; // Top-down DIB
    bmi.bmiHeader.biPlanes = 1;
    bmi.bmiHeader.biBitCount = 32;
    bmi.bmiHeader.biCompression = BI_RGB;

    void* bits = nullptr;
    HBITMAP hbm = CreateDIBSection(mem_dc, &bmi, DIB_RGB_COLORS, &bits, NULL, 0);
    HGDIOBJ old_bm = SelectObject(mem_dc, hbm);

    hwnd_ = (void*)hwnd;
    hdc_ = (void*)hdc;
    mem_dc_ = (void*)mem_dc;
    hbm_ = (void*)hbm;
    old_bm_ = (void*)old_bm;
    dib_pixels_ = (uint32_t*)bits;

    running_ = true;
    return true;
#else
    headless_ = true;
    running_ = true;
    return true;
#endif
}

bool Setun2DBridge::is_running() {
    process_window_events();
    return running_;
}

void Setun2DBridge::process_window_events() {
    if (headless_) return;
#if defined(_WIN32)
    if (!hwnd_) return;
    MSG msg;
    while (PeekMessageA(&msg, NULL, 0, 0, PM_REMOVE)) {
        if (msg.message == WM_QUIT) {
            running_ = false;
        }
        if (msg.message == WM_KEYDOWN) {
            WPARAM key = msg.wParam;
            if (key == VK_LEFT || key == 'A') latest_key_ = -1;
            else if (key == VK_RIGHT || key == 'D') latest_key_ = 1;
            else if (key == VK_UP || key == 'W') latest_key_ = 1;
            else if (key == VK_DOWN || key == 'S') latest_key_ = -1;
            else if (key == VK_SPACE) latest_key_ = 0;
            else if (key == VK_ESCAPE) running_ = false;
        }
        TranslateMessage(&msg);
        DispatchMessageA(&msg);
    }
#endif
}

void Setun2DBridge::clear(uint32_t rgb) {
    if (!running_ || headless_) return;
#if defined(_WIN32)
    if (dib_pixels_) {
        uint32_t fill_color = 0xFF000000 | (rgb & 0xFFFFFF);
        size_t total_pixels = static_cast<size_t>(width_ * height_);
        std::fill(dib_pixels_, dib_pixels_ + total_pixels, fill_color);
    }
#endif
}

void Setun2DBridge::draw_rect(int x, int y, int w, int h, uint32_t rgb) {
    if (!running_ || headless_) return;
#if defined(_WIN32)
    if (!dib_pixels_) return;

    int x0 = std::max(0, x);
    int y0 = std::max(0, y);
    int x1 = std::min(width_, x + w);
    int y1 = std::min(height_, y + h);

    if (x0 >= x1 || y0 >= y1) return;

    uint32_t color = 0xFF000000 | (rgb & 0xFFFFFF);
    for (int cy = y0; cy < y1; ++cy) {
        uint32_t* row = dib_pixels_ + (cy * width_);
        for (int cx = x0; cx < x1; ++cx) {
            row[cx] = color;
        }
    }
#endif
}

void Setun2DBridge::draw_circle(int cx, int cy, int r, uint32_t rgb) {
    if (!running_ || headless_) return;
#if defined(_WIN32)
    if (!dib_pixels_ || r <= 0) return;

    int x0 = std::max(0, cx - r);
    int y0 = std::max(0, cy - r);
    int x1 = std::min(width_, cx + r + 1);
    int y1 = std::min(height_, cy + r + 1);

    uint32_t color = 0xFF000000 | (rgb & 0xFFFFFF);
    int r2 = r * r;

    for (int y = y0; y < y1; ++y) {
        int dy = y - cy;
        int dy2 = dy * dy;
        uint32_t* row = dib_pixels_ + (y * width_);
        for (int x = x0; x < x1; ++x) {
            int dx = x - cx;
            if (dx * dx + dy2 <= r2) {
                row[x] = color;
            }
        }
    }
#endif
}

void Setun2DBridge::draw_text(int x, int y, const std::string& text, uint32_t rgb) {
    if (!running_ || headless_) return;
#if defined(_WIN32)
    if (!mem_dc_) return;
    HDC hdc = (HDC)mem_dc_;
    SetBkMode(hdc, TRANSPARENT);
    COLORREF color = RGB((rgb >> 16) & 0xFF, (rgb >> 8) & 0xFF, rgb & 0xFF);
    SetTextColor(hdc, color);
    TextOutA(hdc, x, y, text.c_str(), static_cast<int>(text.length()));
#endif
}

int Setun2DBridge::flip() {
    process_window_events();
    if (!running_) return 0;

    if (headless_) {
        std::this_thread::sleep_for(std::chrono::milliseconds(16));
        return latest_key_;
    }

#if defined(_WIN32)
    if (hdc_ && mem_dc_) {
        BitBlt((HDC)hdc_, 0, 0, width_, height_, (HDC)mem_dc_, 0, 0, SRCCOPY);
    }
#endif

    // Precise 60 FPS Frame Limiter (16.6 ms per frame)
    auto now = std::chrono::high_resolution_clock::now();
    auto elapsed = std::chrono::duration_cast<std::chrono::microseconds>(now - last_flip_time_).count();
    const int64_t target_frame_us = 16666; // 60 FPS
    if (elapsed < target_frame_us) {
        std::this_thread::sleep_for(std::chrono::microseconds(target_frame_us - elapsed));
    }
    last_flip_time_ = std::chrono::high_resolution_clock::now();

    int res = latest_key_;
    return res;
}

int Setun2DBridge::get_key() {
    process_window_events();
    int k = latest_key_;
    return k;
}

void Setun2DBridge::close() {
    running_ = false;
#if defined(_WIN32)
    if (mem_dc_ && old_bm_) {
        SelectObject((HDC)mem_dc_, (HGDIOBJ)old_bm_);
        old_bm_ = nullptr;
    }
    if (hbm_) {
        DeleteObject((HBITMAP)hbm_);
        hbm_ = nullptr;
    }
    if (mem_dc_) {
        DeleteDC((HDC)mem_dc_);
        mem_dc_ = nullptr;
    }
    if (hwnd_ && hdc_) {
        ReleaseDC((HWND)hwnd_, (HDC)hdc_);
        hdc_ = nullptr;
    }
    if (hwnd_) {
        DestroyWindow((HWND)hwnd_);
        hwnd_ = nullptr;
    }
#endif
}

Setun2DBridge::~Setun2DBridge() {
    close();
}

// C-Linkage wrappers
extern "C" {
    int setun2d_init(int w, int h, const char* title) {
        return Setun2DBridge::instance().init(w, h, title ? title : "Setun 2D Native") ? 1 : 0;
    }

    int setun2d_is_running() {
        return Setun2DBridge::instance().is_running() ? 1 : 0;
    }

    void setun2d_clear(int rgb) {
        Setun2DBridge::instance().clear(static_cast<uint32_t>(rgb));
    }

    void setun2d_draw_rect(int x, int y, int w, int h, int rgb) {
        Setun2DBridge::instance().draw_rect(x, y, w, h, static_cast<uint32_t>(rgb));
    }

    void setun2d_draw_circle(int cx, int cy, int r, int rgb) {
        Setun2DBridge::instance().draw_circle(cx, cy, r, static_cast<uint32_t>(rgb));
    }

    void setun2d_draw_text(int x, int y, const char* text, int rgb) {
        Setun2DBridge::instance().draw_text(x, y, text ? text : "", static_cast<uint32_t>(rgb));
    }

    int setun2d_flip() {
        return Setun2DBridge::instance().flip();
    }

    int setun2d_get_key() {
        return Setun2DBridge::instance().get_key();
    }

    void setun2d_close() {
        Setun2DBridge::instance().close();
    }
}

} // namespace setun::graphics
