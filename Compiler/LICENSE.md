# TERSUN INTELLECTUAL PROPERTY & ACADEMIC RESEARCH LICENSE (TIPARL)
### Phiên bản: 1.0.3 — Bản Quyền Sở Hữu Trí Tuệ & Giấy Phép Nghiên Cứu Khoa Học
**Bản quyền © 2024–2026 Nhóm Nghiên Cứu Kiến Trúc Điện Toán Tersun (Tersun Computing Systems Group). Bảo lưu mọi quyền (All Rights Reserved).**

---

## ĐIỀU 1. ĐỐI TƯỢNG VÀ PHẠM VI BẢO HỘ SỞ HỮU TRÍ TUỆ

Giấy phép này áp dụng cho toàn bộ dự án **Tersun Programming Language & Execution Platform (Phiên bản 1.0.3)**, bao gồm nhưng không giới hạn ở:

1. **Mã nguồn và Kiến trúc Trình biên dịch & Máy ảo**:
   - Tầng đầu trình biên dịch (Lexer Zero-Copy, Pratt Parser, Type Checker, Monomorphizer).
   - Tầng chuẩn hóa & tối ưu hóa cây cú pháp (Tree Canonicalization & 8-pass Tree Optimizer) đạt chuẩn 2.13 triệu bất biến toán học.
   - Tầng mã trung gian tuyến tính (Linear 3-Address IR) và Đồ thị luồng điều khiển (CFG).
   - Máy ảo đa chế độ (Stack-based TVM, Direct Threading Dispatch, NaN-Boxing 64-bit, Adaptive Quickening, Shape Inline Caching).
   - Hệ thống hạ cấp biên dịch bản địa (Native AOT LLVM Lowering Pipeline).
2. **Các Sáng chế Kiến trúc Phần cứng & Số học Độc quyền**:
   - **Vi kiến trúc TAFPU (Ternary Algebraic Floating-Point Unit)**: Hệ thống số học đại số trên trường số $\mathbb{Q}(\sqrt{3})$ với cấu trúc bộ ba $(\alpha, \beta, \gamma)$ đảm bảo **0% sai số tích lũy làm tròn** (Zero Representation Drift), triệt tiêu các khiếm khuyết cơ bản của chuẩn IEEE 754.
   - **Bộ xử lý Tam phân Cân bằng BTVP (Balanced Ternary Virtual Processor)**: Bộ cộng và hệ toán tử tam phân cân bằng $\{-1, 0, 1\}$ triệt tiêu hiện tượng lan truyền sóng nhớ.
   - **Thuật toán BitNet 1.58-bit GEMM không cần bộ nhân**: Phép nhân tích chập ma trận cho AI chạy trên số học tam phân không tiêu tốn chu kỳ nhân phần cứng.
   - **Máy ảo Lượng tử QVM (Quantum Virtual Machine)**: Kiến trúc thực thi không mã lệnh (Zero-Opcode Execution), mô phỏng không gian trạng thái Hilbert 2-bit và cổng lượng tử tam phân Qutrit.
3. **Bộ Giáo Trình Học Thuật Toàn Diện (Tersun Master Curriculum)**:
   - Toàn bộ 2 Đại giáo trình, 6 Tập (Volumes), 16 Phần và 58 Chương chuyên sâu trong thư mục `GT/`:
     - *Giáo trình Hệ thống Tersun: Từ Nền tảng đến Kiến trúc Nâng cao* (Vol 1, 2, 3).
     - *Giáo trình Lập trình Tersun: Từ Nguyên lý Thứ nhất* (Vol 1, 2, 3).
   - Toàn bộ hình ảnh, sơ đồ kiến trúc, văn bản giải thích sư phạm, giáo án thực hành, bài tập và đề án kết khóa.

---

## ĐIỀU 2. CÁC QUYỀN ĐƯỢC PHÉP (PERMITTED USES)

Chủ sở hữu quyền tác giả cấp quyền sử dụng miễn phí, không độc quyền, có thể thu hồi, trên phạm vi toàn cầu cho các cá nhân, học viên, nghiên cứu sinh và tổ chức học thuật tuân thủ nghiêm ngặt các mục đích sau:

1. **Học tập, Giảng dạy và Đào tạo Học thuật (Educational Use)**:
   - Được phép đọc, học tập, nghiên cứu và thảo luận nội dung giáo trình và mã nguồn trong môi trường trường học, viện nghiên cứu hoặc tự học cá nhân.
   - Được phép biên dịch, thực thi các ví dụ mã nguồn và chạy các bài kiểm thử đối chuẩn (benchmarks) trên phần cứng của mình.
2. **Nghiên cứu Khoa học & Thực nghiệm Phi Thương mại (Non-Commercial Scientific Research)**:
   - Được phép sử dụng nền tảng Tersun làm đối tượng hoặc công cụ phục vụ các bài báo nghiên cứu khoa học, luận văn cử nhân, thạc sĩ, tiến sĩ.
   - Mọi công trình công bố có sử dụng hoặc trích dẫn nền tảng Tersun **bắt buộc phải ghi rõ nguồn trích dẫn học thuật (Citation Requirement)** theo định dạng quy định tại Điều 4.

---

## ĐIỀU 3. CÁC HÀNH VI BỊ NGHIÊM CẤM (RESTRICTIONS & PROHIBITIONS)

Bất kỳ hành vi nào dưới đây đều bị coi là **hành vi xâm phạm quyền sở hữu trí tuệ nghiêm trọng** và sẽ bị xử lý theo pháp luật hiện hành về sở hữu trí tuệ và quyền tác giả:

1. **Nghiêm cấm Khai thác Thương mại (Commercial Exploitation Prohibition)**:
   - Nghiêm cấm bán, cho thuê, phân phối lại có thu phí, đóng gói thương mại hoặc cung cấp nền tảng Tersun (toàn bộ hoặc một phần) dưới dạng dịch vụ đám mây thương mại (SaaS/PaaS/IaaS) mà không có **hợp đồng cấp phép thương mại bằng văn bản có chữ ký của tác giả**.
2. **Nghiêm cấm Đạo văn, Sao chép & Phân phối Lậu Giáo trình (Plagiarism & Textbook Reproduction Prohibition)**:
   - Nghiêm cấm việc sao chép, trích đoạt nguyên văn, xuất bản lại (dưới dạng in ấn hoặc ebook điện tử), bán khóa học hoặc tái phân phối nội dung của 6 tập giáo trình trong thư mục `GT/` dưới bất kỳ tên gọi hoặc danh nghĩa nào khác.
3. **Nghiêm cấm Đăng ký Bằng Sáng chế Chiếm đoạt (Patent Troll Prohibition)**:
   - Người sử dụng không được phép nộp đơn xin cấp bằng sáng chế, kiểu dáng công nghiệp hoặc giải pháp hữu ích đối với bất kỳ thuật toán, vi kiến trúc nào đã được công bố trong mã nguồn và tài liệu của Tersun (bao gồm TAFPU, BTVP, Zero-Opcode QVM, BitNet GEMM).
4. **Bảo vệ Tính Toàn vẹn và Thương hiệu (Integrity & Trademark Protection)**:
   - Không được phép gỡ bỏ các thông báo bản quyền, nhãn hiệu bản quyền, chữ ký mã băm mật mã (SHA-256 milestone seals) hoặc thông tin tác giả khỏi mã nguồn, tài liệu và các sản phẩm phái sinh.

---

## ĐIỀU 4. YÊU CẦU TRÍCH DẪN KHOA HỌC (CITATION MANDATE)

Nếu bạn sử dụng Tersun hoặc các tài liệu trong dự án này cho các nghiên cứu, bài báo hoặc báo cáo kỹ thuật, bạn bắt buộc phải trích dẫn theo định dạng chuẩn BibTeX sau:

```bibtex
@software{tersun_platform_2026,
  author = {Tersun Computing Systems Research Group},
  title = {Tersun 1.0.3: Unified Balanced Ternary Computing, AOT Compiler and Quantum State Simulator},
  year = {2026},
  url = {https://github.com/Stufusic/Tersun},
  version = {1.0.3},
  note = {Verified with 2.13M Mathematical Invariants and Deterministic Milestone Cryptographic Seals}
}
```

---

## ĐIỀU 5. TUYÊN BỐ MIỄN TRỪ TRÁCH NHIỆM (DISCLAIMER OF WARRANTY)

PHẦN MỀM VÀ TÀI LIỆU NÀY ĐƯỢC CUNG CẤP "NGUYÊN TRẠNG" (AS IS), KHÔNG CÓ BẤT KỲ SỰ BẢO ĐẢM NÀO DÙ LÀ MINH THỊ HAY NGỤ Ý, BAO GỒM NHƯNG KHÔNG GIỚI HẠN Ở CÁC BẢO ĐẢM VỀ KHẢ NĂNG THƯƠNG MẠI, TÍNH PHÙ HỢP CHO MỘT MỤC ĐÍCH CỤ THỂ HOẶC KHÔNG XÂM PHẠM QUYỀN CỦA BÊN THỨ BA. TRONG MỌI TRƯỜNG HỢP, TÁC GIẢ HOẶC CÁC BÊN ĐÓNG GÓP SẼ KHÔNG CHỊU TRÁCH NHIỆM CHO BẤT KỲ KHIẾU NẠI, THIỆT HẠI TRỰC TIẾP HAY GIÁN TIẾP NÀO PHÁT SINH TỪ VIỆC SỬ DỤNG HOẶC KHÔNG THỂ SỬ DỤNG PHẦN MỀM NÀY.

---

*Mọi yêu cầu cấp phép thương mại hoặc hợp tác nghiên cứu chuyên sâu, vui lòng liên hệ trực tiếp với tác giả và đại diện dự án Tersun.*
