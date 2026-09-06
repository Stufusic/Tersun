# rv_Doc — Review thư mục `Doc/`

> Ngày review: 2026-09-06 · HEAD: `2948efe`

## Nội dung hiện có

| File | Loại | Đánh giá |
|---|---|---|
| `Appfirst.md` | Định hướng sản phẩm | ✅ Giá trị cao nhất — chọn Scientific Lab làm product wedge; là nguồn cho lộ trình hiện tại |
| `rv Plan New 1.0.2.md` | Tự review kiến trúc 1.0.2 | ✅ Chất lượng tốt — tự chấm 7/10 kiến trúc, 4-5/10 bằng chứng compat; các cảnh báo đã được xác nhận đúng qua review code |
| `Plan_new 1 1.0.2.md` | Kế hoạch 1.0.2 | ⚠️ Cũ một phần — viết trước khi native dispatch được implement thật |
| `Language_Specification.md` | Spec ngôn ngữ | ⚠️ **Lạc hậu nghiêm trọng** — chưa có: for/break/continue/elif, `&&`/`\|\|`, f-string interpolate, try/catch, `import as` + pub/priv, taf3[...] / taf3(...), ulen/uslice/uindex, constructor auto-init. Đây là nợ tài liệu lớn nhất |
| `Huong_Dan_Lap_Trinh_Setun.md` | Giáo trình | ⚠️ Cùng trạng thái — ví dụ vẫn dùng if lồng vì viết trước khi có `&&` |
| `GIAO_TRINH_VA_CAM_NANG_TERSUN.md` | Giáo trình | ⚠️ Như trên |
| `LANGUAGE_COMPARISON.md` | So sánh | ⚠️ Cần cập nhật bảng tính năng sau Tier 1/2 |
| `Hardware_Reference_Manual.md` | Phần cứng | — (phạm vi TAFPU/RTL, không chặn) |
| `Pipeline.md` | Kiến trúc pipeline | ⚠️ Thiếu mô tả ModuleResolver/namespacing và 3 opcode mới (OP_TRY/THROW/OP_POP_TRY) |
| `FormalVerification_Lean4.lean` | Lean 4 | — (thí nghiệm; chưa nối với pipeline thật) |
| `Rule.md` | Quy tắc | — |
| `rv1.md` | Review cũ | Đã bị thay thế bởi bộ rv_*.md hiện tại — nên xóa hoặc archive |

## Vấn đề chính

1. **Spec ngôn ngữ tụt hậu 2 milestone.** Mọi tính năng từ commit `44586d1`, `304f953`, `2948efe` chưa có trong tài liệu. Người mới đọc Language_Specification sẽ không biết ngôn ngữ có `for`.
2. **Version drift**: nhiều file vẫn ghi 1.0.2 trong khi banner/binary là 1.0.3.
3. **Claims chưa có dẫn chứng**: "zero algebraic drift", "0% sai số" xuất hiện trong giáo trình mà không có benchmark độc lập kèm theo — rủi ro uy tín nếu public repo.
4. **Thiếu tài liệu mới cần thiết**: hướng dẫn module/namespace (import as + priv), bảng opcode Q-ISA (sau khi disasm chuẩn hóa), quy ước `len()` = byte vs `ulen()` = codepoint.

## Khuyến nghị (ưu tiên)

1. **Cập nhật `Language_Specification.md`** theo đúng semantics tại `2948efe` — đây là điều kiện cần trước khi public repo. Nên sinh phần "khu vực ổn định" trực tiếp từ test .stn trong `Code/tests/stn/` (mỗi test = 1 mục spec có ví dụ chạy được).
2. Đổi toàn bộ version string trong Doc về 1.0.3 hoặc đánh dấu "1.0.2 legacy".
3. Bổ sung 1 trang "Known limitations" (trần 64KB, Q-ISA demo-grade, emit-c continue) — trung thực sớm rẻ hơn gấp lỗi sau.
4. Xóa/archive `rv1.md`.

---

## 🔄 Cập nhật Tier 3 (2026-09-06)

Tier 1–3 đã triển khai xong M1–M5 (closures, generics, interface, exceptions, namespaces, Unicode, for/elif/&&||) — **khoảng cách giữa Language_Specification và ngôn ngữ thực tế tăng thêm**, hiện ước ~3 milestone. README.md đã cập nhật 1.0.3 + mục "What's New".

Ưu tiên cập nhật tài liệu điều chỉnh theo thứ tự: (1) Language_Specification theo `Code/tests/stn/` (mỗi test = 1 mục có ví dụ), (2) hướng dẫn `import as` + pub/priv + try/catch, (3) bảng opcode Q-ISA sau khi disasm chuẩn hóa, (4) quy ước len()=byte vs ulen()=codepoint.
