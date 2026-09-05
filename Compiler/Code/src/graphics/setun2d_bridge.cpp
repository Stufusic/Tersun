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
#include <commdlg.h>
#endif

namespace setun::graphics {

#if defined(_WIN32)
// UTF-8 (Tersun strings) -> UTF-16 (Win32 W API boundary).
static std::wstring utf8_to_utf16(const std::string& s) {
    if (s.empty()) return std::wstring();
    int n = MultiByteToWideChar(CP_UTF8, 0, s.c_str(), static_cast<int>(s.size()), nullptr, 0);
    std::wstring w(static_cast<size_t>(n > 0 ? n : 0), L'\0');
    if (n > 0) {
        MultiByteToWideChar(CP_UTF8, 0, s.c_str(), static_cast<int>(s.size()), &w[0], n);
    }
    return w;
}

static LRESULT CALLBACK Setun2DWndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam) {
    switch (msg) {
        case WM_CLOSE:
        case WM_DESTROY:
            PostQuitMessage(0);
            return 0;
        case WM_ERASEBKGND:
            return 1; // Prevent background flicker (double-buffering handles it)
        default:
            return DefWindowProcW(hwnd, msg, wParam, lParam);
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

    WNDCLASSEXW wc;
    ZeroMemory(&wc, sizeof(wc));
    wc.cbSize = sizeof(WNDCLASSEXW);
    wc.style = CS_HREDRAW | CS_VREDRAW | CS_OWNDC;
    wc.lpfnWndProc = Setun2DWndProc;
    wc.hInstance = hInstance;
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)GetStockObject(BLACK_BRUSH);
    wc.lpszClassName = L"Setun2DNativeWindowClassW";

    RegisterClassExW(&wc);

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

    // W window: WM_CHAR delivers UTF-16 code units for any keyboard layout.
    std::wstring wtitle = utf8_to_utf16(title);
    HWND hwnd = CreateWindowExW(
        0,
        L"Setun2DNativeWindowClassW",
        wtitle.c_str(),
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
    SetForegroundWindow(hwnd);
    SetFocus(hwnd);

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

    // Unicode-capable UI font (Segoe UI covers Vietnamese + Latin fully).
    // Previously no font was selected: windows rendered the stock bitmap font.
    HFONT font = CreateFontW(
        -16, 0, 0, 0, FW_NORMAL, FALSE, FALSE, FALSE,
        DEFAULT_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
        CLEARTYPE_QUALITY, DEFAULT_PITCH | FF_DONTCARE, L"Segoe UI");
    if (font) {
        old_font_ = (void*)SelectObject(mem_dc, (HGDIOBJ)font);
        font_ = (void*)font;
    }

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
    while (PeekMessageW(&msg, NULL, 0, 0, PM_REMOVE)) {
        if (msg.message == WM_QUIT) {
            running_ = false;
        }
        if (msg.message == WM_KEYDOWN) {
            WPARAM key = msg.wParam;
            if (key < 256) keys_down_[key] = true;
            if (key == VK_LEFT || key == 'A') latest_key_ = -1;
            else if (key == VK_RIGHT || key == 'D') latest_key_ = 1;
            else if (key == VK_UP || key == 'W') latest_key_ = 1;
            else if (key == VK_DOWN || key == 'S') latest_key_ = -1;
            else if (key == VK_SPACE) latest_key_ = 0;
            else if (key == VK_ESCAPE) running_ = false;
        } else if (msg.message == WM_KEYUP) {
            WPARAM key = msg.wParam;
            if (key < 256) keys_down_[key] = false;
        } else if (msg.message == WM_CHAR) {
            // W window: wParam is a UTF-16 code unit. Combine surrogate pairs
            // and queue full Unicode codepoints.
            uint32_t cp = static_cast<uint32_t>(msg.wParam);
            if (cp >= 0xD800 && cp <= 0xDBFF) {
                pending_surrogate_ = cp;
            } else if (cp >= 0xDC00 && cp <= 0xDFFF) {
                if (pending_surrogate_ != 0) {
                    cp = 0x10000 + ((pending_surrogate_ - 0xD800) << 10) + (cp - 0xDC00);
                    pending_surrogate_ = 0;
                } else {
                    cp = 0xFFFD;
                }
                char_queue_.push_back(static_cast<int>(cp));
            } else {
                pending_surrogate_ = 0;
                char_queue_.push_back(static_cast<int>(cp));
            }
        } else if (msg.message == WM_MOUSEWHEEL) {
            short delta = GET_WHEEL_DELTA_WPARAM(msg.wParam);
            if (delta > 0) wheel_delta_ += 1;
            else if (delta < 0) wheel_delta_ -= 1;
        }
        if (msg.message == WM_MOUSEMOVE) {
            mouse_x_ = static_cast<short>(LOWORD(msg.lParam));
            mouse_y_ = static_cast<short>(HIWORD(msg.lParam));
        } else if (msg.message == WM_LBUTTONDOWN) {
            SetFocus((HWND)hwnd_);
            mouse_left_down_ = true;
            mouse_left_clicked_latched_ = true;
            mouse_last_btn_ = -1;
            mouse_x_ = static_cast<short>(LOWORD(msg.lParam));
            mouse_y_ = static_cast<short>(HIWORD(msg.lParam));
        } else if (msg.message == WM_LBUTTONUP) {
            mouse_left_down_ = false;
            mouse_x_ = static_cast<short>(LOWORD(msg.lParam));
            mouse_y_ = static_cast<short>(HIWORD(msg.lParam));
        } else if (msg.message == WM_MBUTTONDOWN) {
            mouse_mid_down_ = true;
            mouse_mid_clicked_latched_ = true;
            mouse_last_btn_ = 0;
            mouse_x_ = static_cast<short>(LOWORD(msg.lParam));
            mouse_y_ = static_cast<short>(HIWORD(msg.lParam));
        } else if (msg.message == WM_MBUTTONUP) {
            mouse_mid_down_ = false;
            mouse_x_ = static_cast<short>(LOWORD(msg.lParam));
            mouse_y_ = static_cast<short>(HIWORD(msg.lParam));
        } else if (msg.message == WM_RBUTTONDOWN) {
            mouse_right_down_ = true;
            mouse_right_clicked_latched_ = true;
            mouse_last_btn_ = 1;
            mouse_x_ = static_cast<short>(LOWORD(msg.lParam));
            mouse_y_ = static_cast<short>(HIWORD(msg.lParam));
        } else if (msg.message == WM_RBUTTONUP) {
            mouse_right_down_ = false;
            mouse_x_ = static_cast<short>(LOWORD(msg.lParam));
            mouse_y_ = static_cast<short>(HIWORD(msg.lParam));
        } else if (msg.message == WM_KILLFOCUS ||
                   (msg.message == WM_ACTIVATE && LOWORD(msg.wParam) == WA_INACTIVE)) {
            // Losing focus means the pending WM_KEYUP events will never arrive;
            // clear all held keys/buttons so input state cannot get stuck.
            for (int i = 0; i < 256; ++i) keys_down_[i] = false;
            mouse_left_down_ = false;
            mouse_mid_down_ = false;
            mouse_right_down_ = false;
        }
        TranslateMessage(&msg);
        DispatchMessageA(&msg);
    }

    // Direct cursor polling for sub-frame responsiveness
    POINT pt;
    if (GetCursorPos(&pt)) {
        if (ScreenToClient((HWND)hwnd_, &pt)) {
            if (pt.x >= 0 && pt.x < width_ && pt.y >= 0 && pt.y < height_) {
                mouse_x_ = pt.x;
                mouse_y_ = pt.y;
            }
        }
    }
#endif
}

bool Setun2DBridge::is_mouse_down(int btn) const {
    if (btn == -1) {
        bool physical = false;
#if defined(_WIN32)
        if (hwnd_ && GetForegroundWindow() == (HWND)hwnd_) {
            physical = (GetAsyncKeyState(VK_LBUTTON) & 0x8000) != 0;
        }
#endif
        return mouse_left_down_ || mouse_left_clicked_latched_ || physical;
    }
    if (btn == 0) {
        bool physical = false;
#if defined(_WIN32)
        if (hwnd_ && GetForegroundWindow() == (HWND)hwnd_) {
            physical = (GetAsyncKeyState(VK_MBUTTON) & 0x8000) != 0;
        }
#endif
        return mouse_mid_down_ || mouse_mid_clicked_latched_ || physical;
    }
    if (btn == 1) {
        bool physical = false;
#if defined(_WIN32)
        if (hwnd_ && GetForegroundWindow() == (HWND)hwnd_) {
            physical = (GetAsyncKeyState(VK_RBUTTON) & 0x8000) != 0;
        }
#endif
        return mouse_right_down_ || mouse_right_clicked_latched_ || physical;
    }
    return false;
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

void Setun2DBridge::draw_line(int x1, int y1, int x2, int y2, uint32_t rgb) {
    if (!running_ || headless_) return;
#if defined(_WIN32)
    if (!dib_pixels_) return;
    int dx = std::abs(x2 - x1);
    int dy = std::abs(y2 - y1);
    int sx = (x1 < x2) ? 1 : -1;
    int sy = (y1 < y2) ? 1 : -1;
    int err = dx - dy;
    uint32_t color = 0xFF000000 | (rgb & 0xFFFFFF);
    while (true) {
        if (x1 >= 0 && x1 < width_ && y1 >= 0 && y1 < height_) {
            dib_pixels_[y1 * width_ + x1] = color;
        }
        if (x1 == x2 && y1 == y2) break;
        int e2 = 2 * err;
        if (e2 > -dy) { err -= dy; x1 += sx; }
        if (e2 < dx) { err += dx; y1 += sy; }
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
    // UTF-8 -> UTF-16 so any script (Vietnamese included) renders correctly.
    std::wstring w = utf8_to_utf16(text);
    if (!w.empty()) {
        TextOutW(hdc, x, y, w.c_str(), static_cast<int>(w.size()));
    }
#endif
}

int Setun2DBridge::text_width(const std::string& text) {
#if defined(_WIN32)
    if (!mem_dc_) return 0;
    std::wstring w = utf8_to_utf16(text);
    SIZE sz = { 0, 0 };
    if (GetTextExtentPoint32W((HDC)mem_dc_, w.c_str(), static_cast<int>(w.size()), &sz)) {
        return sz.cx;
    }
#endif
    return static_cast<int>(text.size()) * 8;
}

int Setun2DBridge::flip() {
    // Reset click latches from the frame that just finished rendering
    mouse_left_clicked_latched_ = false;
    mouse_mid_clicked_latched_ = false;
    mouse_right_clicked_latched_ = false;

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
    if (mem_dc_ && old_font_) {
        SelectObject((HDC)mem_dc_, (HGDIOBJ)old_font_);
        old_font_ = nullptr;
    }
    if (font_) {
        DeleteObject((HFONT)font_);
        font_ = nullptr;
    }
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

void Setun2DBridge::set_mouse_pos(int client_x, int client_y) {
#if defined(_WIN32)
    if (hwnd_) {
        POINT pt = { client_x, client_y };
        ClientToScreen((HWND)hwnd_, &pt);
        SetCursorPos(pt.x, pt.y);
    }
#endif
    mouse_x_ = client_x;
    mouse_y_ = client_y;
}

void Setun2DBridge::mouse_click(int btn, int client_x, int client_y) {
    set_mouse_pos(client_x, client_y);
#if defined(_WIN32)
    DWORD down_flag = 0;
    DWORD up_flag = 0;
    if (btn == -1) {
        down_flag = MOUSEEVENTF_LEFTDOWN;
        up_flag = MOUSEEVENTF_LEFTUP;
    } else if (btn == 0) {
        down_flag = MOUSEEVENTF_MIDDLEDOWN;
        up_flag = MOUSEEVENTF_MIDDLEUP;
    } else if (btn == 1) {
        down_flag = MOUSEEVENTF_RIGHTDOWN;
        up_flag = MOUSEEVENTF_RIGHTUP;
    }
    if (down_flag != 0) {
        INPUT inputs[2];
        ZeroMemory(inputs, sizeof(inputs));
        inputs[0].type = INPUT_MOUSE;
        inputs[0].mi.dwFlags = down_flag;
        inputs[1].type = INPUT_MOUSE;
        inputs[1].mi.dwFlags = up_flag;
        SendInput(2, inputs, sizeof(INPUT));
    }
#endif
}

int Setun2DBridge::get_char() {
    process_window_events();
    if (char_queue_.empty()) return 0;
    int ch = char_queue_.front();
    char_queue_.erase(char_queue_.begin());
    return ch;
}

std::string Setun2DBridge::file_dialog_save(const std::string& filter, const std::string& default_ext) {
#if defined(_WIN32)
    if (headless_ || !hwnd_) return "";
    char szFile[MAX_PATH] = { 0 };
    OPENFILENAMEA ofn;
    ZeroMemory(&ofn, sizeof(ofn));
    ofn.lStructSize = sizeof(ofn);
    ofn.hwndOwner = (HWND)hwnd_;
    ofn.lpstrFile = szFile;
    ofn.nMaxFile = sizeof(szFile);

    std::string win_filter;
    for (char c : filter) {
        if (c == '|') win_filter.push_back('\0');
        else win_filter.push_back(c);
    }
    win_filter.push_back('\0');
    win_filter.push_back('\0');
    ofn.lpstrFilter = win_filter.c_str();
    ofn.nFilterIndex = 1;
    ofn.lpstrDefExt = default_ext.empty() ? nullptr : default_ext.c_str();
    ofn.Flags = OFN_PATHMUSTEXIST | OFN_OVERWRITEPROMPT | OFN_NOCHANGEDIR;
    if (GetSaveFileNameA(&ofn)) {
        return std::string(szFile);
    }
#endif
    return "";
}

std::string Setun2DBridge::file_dialog_open(const std::string& filter) {
#if defined(_WIN32)
    if (headless_ || !hwnd_) return "";
    char szFile[MAX_PATH] = { 0 };
    OPENFILENAMEA ofn;
    ZeroMemory(&ofn, sizeof(ofn));
    ofn.lStructSize = sizeof(ofn);
    ofn.hwndOwner = (HWND)hwnd_;
    ofn.lpstrFile = szFile;
    ofn.nMaxFile = sizeof(szFile);

    std::string win_filter;
    for (char c : filter) {
        if (c == '|') win_filter.push_back('\0');
        else win_filter.push_back(c);
    }
    win_filter.push_back('\0');
    win_filter.push_back('\0');
    ofn.lpstrFilter = win_filter.c_str();
    ofn.nFilterIndex = 1;
    ofn.Flags = OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST | OFN_NOCHANGEDIR;
    if (GetOpenFileNameA(&ofn)) {
        return std::string(szFile);
    }
#endif
    return "";
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

    void setun2d_draw_line(int x1, int y1, int x2, int y2, int rgb) {
        Setun2DBridge::instance().draw_line(x1, y1, x2, y2, static_cast<uint32_t>(rgb));
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

    int setun2d_text_width(const char* text) {
        return Setun2DBridge::instance().text_width(text ? text : "");
    }

    // Mouse C API (Tersun 1.0.2 Native Host Extension)
    int setun2d_get_mouse_x() {
        return Setun2DBridge::instance().get_mouse_x();
    }

    int setun2d_get_mouse_y() {
        return Setun2DBridge::instance().get_mouse_y();
    }

    int setun2d_get_mouse_btn() {
        return Setun2DBridge::instance().get_mouse_btn();
    }

    int setun2d_is_mouse_down(int btn) {
        return Setun2DBridge::instance().is_mouse_down(btn) ? 1 : 0;
    }

    void setun2d_set_mouse_pos(int x, int y) {
        Setun2DBridge::instance().set_mouse_pos(x, y);
    }

    void setun2d_mouse_click(int btn, int x, int y) {
        Setun2DBridge::instance().mouse_click(btn, x, y);
    }

    int setun2d_get_wheel() {
        return Setun2DBridge::instance().get_wheel_delta();
    }

    // Keyboard C API (Tersun 1.0.3 Native Host Extension)
    int setun2d_get_char() {
        return Setun2DBridge::instance().get_char();
    }

    int setun2d_is_key_down(int vk_code) {
        return Setun2DBridge::instance().is_key_down(vk_code) ? 1 : 0;
    }

    static std::string g_dialog_save_buf;
    const char* setun2d_file_dialog_save(const char* filter, const char* def_ext) {
        g_dialog_save_buf = Setun2DBridge::instance().file_dialog_save(filter ? filter : "", def_ext ? def_ext : "");
        return g_dialog_save_buf.c_str();
    }

    static std::string g_dialog_open_buf;
    const char* setun2d_file_dialog_open(const char* filter) {
        g_dialog_open_buf = Setun2DBridge::instance().file_dialog_open(filter ? filter : "");
        return g_dialog_open_buf.c_str();
    }
}

} // namespace setun::graphics
