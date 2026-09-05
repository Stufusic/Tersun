# rv_Projects — Review thư mục `Projects/`

> Ngày review: 2026-09-06 · HEAD: `2948efe`

## Cấu trúc

```
Projects/
├── ScientificLab/       # Cộng mồi của Scientific Lab (9 app .stn + .tbc)
├── QuantumLogicDemo/    # Demo quantum (main.stn + artifacts)
└── std/                 # BẢN COPY stdlib — bị build script đồng bộ từ Code/include/stdtaf
```

## 1. `ScientificLab/` — 9/9 compile pass sau Tier 2

| File | Trạng thái | Ghi chú |
|---|---|---|
| `algebraic_solver.stn` | ✅ OK | Chạy độc lập được (Gauss-Jordan Q(√3)); **vai trò kép app/thư viện** — main đã được namespacing khi bị import |
| `matlab_studio_v2.stn` | ✅ OK | Đã sửa: trùng `main` với thư viện import (trước đây im lặng đè nhau) |
| `ternary_calculator_app.stn` | ✅ OK | Đã sửa 2 bug ẩn: `ContextMenu.init` sai arity (trước đây menu width=rác), `tooltip.init()` thiếu delay (tooltip trước đây không bao giờ hiện) |
| `ternary_math_engine.stn` | ✅ OK | 41 triple literal taf3 — case kiểm chứng chính cho AmbiguousTriple |
| `qutrit_3d.stn` | ✅ OK | 21KB bytecode — file lớn nhất, gần nửa trần OP_CALL 16-bit; theo dõi |
| `waveform_plotter.stn` / `scientific_lab.stn` / `test_mouse_*.stn` | ✅ OK | Nguyên liệu tốt cho Lab shell — nên refactor vào Lab thay vì để quốc lự |

**Vấn đề cấu trúc:** các file này là "mồi" nhưng đang sống song song với Lab đích — khi dựng Lab shell, cần quyết rõ file nào thành module trong Lab, file nào nghỉ hưu.

## 2. `QuantumLogicDemo/`

✅ Đã sửa bug thật: `QuantumPacket(101, ...)` truyền 4 args cho struct không init — **`qubit_tag` trước đây âm thầm = 0, checksum tính sai**; giờ gán field tường minh, checksum = 46 đúng ý. Artifact `.ll/.qasm/.qbc` là build output — .gitignore đã che.

## 3. `std/`

Bản copy của `Code/include/stdtaf` — **build_toolchain.bat đồng bộ tự động sau mỗi build** (chống drift). Hiện đã sync với Unicode milestone (gui.stn TextInput, mouse.stn text_width). Về lâu dài cân nhắc bỏ hẳn copy này và trỏ resolver thẳng vào một nguồn.

## Khuyến nghị

1. Khi bắt đầu Lab: tạo `Projects/ScientificLab/main.stn` (shell) + `Projects/ScientificLab/lab/` cho các module demo; refactor 9 file mồi vào đó hoặc đánh dấu deprecated.
2. `test_mouse_api.stn`/`test_mouse_interaction.stn` là test GUI chạy tay — nên chuyển thành script assert headless được thì đưa vào suite.
3. Đổi tên các file .stn mồi có tiền tố rõ ràng (`legacy_`) nếu giữ lại, để tránh nhầm với module Lab chính thức.
