# rv_tests — Review thư mục `tests/` (root)

> Ngày review: 2026-09-06 · HEAD: `2948efe`
> Lưu ý phân biệt: suite chính thức nằm ở `Code/tests/` (script .stn + C++ runner, chạy trong `setunc_test`). Thư mục `tests/` ở root là **cụm test chạy tay thời 1.0.2**.

## Nội dung

| File | Trạng thái | Đánh giá |
|---|---|---|
| `test_file_io.stn` (+.tbc) | ✅ còn hợp lệ | fs roundtrip — trùng phạm vi với `Code/tests/stn/fs_roundtrip.stn` (đã vào suite chính thức) |
| `test_multi_import.stn` (+.tbc) | ✅ còn hợp lệ | Trùng phạm vi với `Code/tests/stn/modules_ok.stn` |
| `test_advanced_mouse.stn` (+.tbc) | ✅ | Test GUI chạy tay (MouseTracker/double-click/drag) — không assert tự động |
| `test_visualization.stn` (+.tbc) | ✅ | GUI chạy tay |
| `test_ternary_calculator.stn` | ✅ compile | Nhiều triple literal taf3 — đã pass sweep AmbiguousTriple |
| `verify_opcode_whitelist.py` | ⚠️ | Script kiểm tra "zero new opcode" — **lạc hậu**: Tier 2 đã thêm 3 opcode (OP_TRY 0xA7/OP_THROW 0xA8/OP_POP_TRY 0xA9); cần cập nhật whitelist hoặc ghi chú chính sách mới |

## Vấn đề

1. **Trùng lặp với suite chính thức**: test_file_io/test_multi_import đã có bản tốt hơn trong `Code/tests/stn/` chạy tự động mỗi `setunc_test`/CI. Giữ cả hai = hai nguồn sự thật.
2. **Không tự động**: mọi test ở đây phải chạy tay bằng `setunc run` — CI không chạm tới.
3. **verify_opcode_whitelist.py** phản ánh chính sách cũ; chính sách hiện tại là "zero new opcode trừ khi bắt buộc" (try/catch là exception đầu tiên, có ghi chú).

## Khuyến nghị

1. Nâng cấp `test_ternary_calculator.stn` + `test_advanced_mouse.stn` thành script assert (`assert_eq` + in marker) rồi đưa vào `Code/tests/stn/` — loại bớt bản cũ.
2. Sau khi di chuyển, xóa các file trùng ở root để `tests/` chỉ còn thứ chưa suite-ify.
3. Cập nhật `verify_opcode_whitelist.py`: thêm 3 opcode mới + đổi thông điệp thành "opcode mới phải có lý do ghi trong commit".
