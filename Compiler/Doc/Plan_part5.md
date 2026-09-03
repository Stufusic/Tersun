### Kế hoạch Triển khai Giai đoạn 5: Kiểm định Toán học Hình thức, Tích hợp Thực chiến Động cơ Sản xuất & Hệ điều hành Vi mô Tam phân

Giai đoạn 5 là bước hoàn thiện cao nhất để đưa ngôn ngữ và nền tảng TAFPU từ một công cụ nghiên cứu thử nghiệm thành một tiêu chuẩn hệ thống vững chắc, phục vụ kiểm định hình thức, tích hợp trực tiếp vào các dự án sản phẩm quy mô lớn (mô phỏng vật lý, game engine, hệ thống thời gian thực) và chạy độc lập trên phần cứng không qua OS trung gian.

---

### Module 1: Kiểm định Hình thức & Chứng minh Toán học (Formal Verification)

* **Mô hình hóa Tiên đề & Bổ đề trên Trợ lý Chứng minh (Lean 4 / Coq):**
* Định nghĩa cấu trúc đại số trường số bậc hai $\mathbb{Q}(\sqrt{3})$ và hệ số nguyên tam phân cân bằng trong hệ thống chứng minh hình thức.


* Chứng minh chặt chẽ định lý: *Mọi chuỗi phép toán cộng, trừ, nhân trên thanh ghi TAFPU $[A, B, S]$ đều bảo toàn tính chính xác đại số tuyệt đối với sai số tích lũy bằng $0\%$*.




* **Xác thực Trình biên dịch Đúng đắn (Verified Compiler Frontend):**
* Chứng minh ngữ nghĩa của cây cú pháp trừu tượng (AST Semantics) tương đương $1:1$ với chuỗi lệnh Bytecode sinh ra cho máy ảo Setun-70.
* Đảm bảo bộ tối ưu hóa không bao giờ làm biến đổi tính đúng đắn của logic 3 trạng thái trong quá trình rút gọn cây (Constant Folding / Dead Code Elimination).


* **Chứng minh An toàn Kiểu dữ liệu (Type Safety Proofs):**
* Chứng minh hệ thống kiểu tĩnh của ngôn ngữ không bao giờ dẫn đến trạng thái bế tắc hoặc Undefined Behavior ở thời gian thực thi (Soundness & Progress Theorems).



---

### Module 2: Tích hợp Thực chiến vào Hệ thống Game & Động cơ Đồ họa Độc quyền

* **Scripting Engine Nhúng cho Logic Trò chơi (Game Scripting Engine):**
* Tích hợp máy ảo Setun-70 vào vòng lặp chính của Game Engine C++ (Update Loop) với chi phí chuyển ngữ cảnh (Context-Switching Overhead) tối thiểu.
* Hiện thực hóa toàn bộ logic hành vi NPC, máy trạng thái hữu hạn (FSM) và cây hành vi (Behavior Trees) dựa trên logic 3 ngôi (`-1: Thù địch / 0: Trung lập / +1: Đồng minh`).




* **Hệ thống Tính toán Sát thương & Động học Tọa độ Cực đại (Exact Combat & Spatial Physics):**
* Sử dụng kiểu dữ liệu `tvec3` và `taf3` để tính toán toàn bộ công thức sát thương, hiệu ứng kỹ năng và va chạm hình học đa giác mà không bị lỗi làm tròn số thực.


* Quản lý tọa độ không gian vũ trụ quy mô lớn (Sci-fi Infinite Coordinates) mà không xảy ra hiện tượng rung/trôi vật thể (Coordinate Jittering) khi thực thể di chuyển cách xa tâm bản đồ.




* **Động cơ Nội suy AI Tam phân Cục bộ (Local Real-time Ternary AI):**
* Nhúng mô hình mạng nơ-ron trọng số tam phân $\{-1, 0, 1\}$ (BitNet) chạy trực tiếp thông qua thư viện `tmat` (Multiplication-free GEMM).


* Thực thi suy luận hành vi thông minh cho hàng ngàn thực thể cùng lúc mà không làm suy giảm FPS hoặc tiêu tốn tài nguyên GPU.



---

### Module 3: Hệ điều hành Vi mô Tam phân (Ternary Bare-Metal Microkernel)

* **Khởi chạy Độc lập trên Phần cứng (Bare-Metal Runtime / Bootloader):**
* Viết Bootloader khởi tạo trực tiếp vi xử lý (x86-64 / ARM / RISC-V) và nạp runtime Setun-70 mà không cần hệ điều hành máy chủ (Linux / Windows).


* **Quản lý Bộ nhớ Phân trang Tryte (Tryte-Addressable Paging):**
* Hiện thực hóa bảng phân trang bộ nhớ ảo dựa trên đơn vị Tryte.


* Gán quyền truy cập bộ nhớ theo 3 trạng thái phần cứng tự nhiên: `-1 (Read-Only)`, `0 (No-Access / Protected)`, `+1 (Read-Write)`.


* **Bộ Điều phối Tiến trình Thời gian Thực 3 Ngôi (Tri-state Real-time Scheduler):**
* Thuật toán lập lịch ưu tiên dựa trên thanh ghi trạng thái Trit:
* `Mức -1 (Low/Background Task):` Tác vụ dọn dẹp bộ nhớ, I/O chậm.
* `Mức  0 (Normal Task):` Tiến trình người dùng thông thường.
* `Mức +1 (Critical/Realtime Task):` Vòng lặp vật lý và tương tác ngắt phần cứng.





---

### Module 4: Đặc tả Kỹ thuật Chuẩn & Hệ sinh thái Mã nguồn Mở (Standard Spec & Documentation)

* **Bản Đặc tả Ngôn ngữ Chính thức (The Official Language Specification):**
* Văn bản hóa toàn bộ ngữ pháp chuẩn EBNF, hệ thống kiểu dữ liệu tĩnh, cơ chế quản lý bộ nhớ Tri-Color GC và tập lệnh Bytecode ISA của Setun-70.




* **Hạ tầng WebAssembly Playground (Online Setun Studio):**
* Biên dịch toàn bộ trình biên dịch `setunc` và máy ảo Setun-70 sang WebAssembly (Wasm).
* Xây dựng giao diện web cho phép viết mã nguồn `.taf`, chạy thử nghiệm trực tiếp trên trình duyệt và theo dõi trạng thái từng thanh ghi $[A, B, S]$ trong thời gian thực.




* **Bộ Tài liệu Kiến trúc Phần cứng cho Kỹ sư Thiết kế Mạch (Hardware Reference Manual):**
* Hướng dẫn chi tiết cách ánh xạ khối ALU TAFPU và mạch lan truyền Carry BTVP lên các kiến trúc chip bán dẫn tùy chỉnh (ASIC / FPGA).





---

### Module 5: Bộ Kiểm định Chịu tải & Nghiệm thu Cuối cùng (Ultimate Verification Suite)

* **Test Case 1: Kiểm định Chứng minh Lean 4 (Formal Verification Suite):** Toàn bộ các định lý toán học cốt lõi của TAFPU được biên dịch và vượt qua bộ kiểm tra logic của Lean 4 mà không sử dụng tiên đề thừa (`sorry`).


* **Test Case 2: Stress-test Động cơ Vật lý Liên tục (Long-run Stability Test):** Chạy mô phỏng tích phân chuyển động của 100,000 vật thể 3D trong 48 giờ liên tục, kiểm tra rò rỉ bộ nhớ ($0\text{ bytes leak}$) và độ lệch sai số tọa độ tích lũy đạt mức $0\%$ tuyệt đối.


* **Test Case 3: Benchmark Tích hợp Game Loop (Real-world Engine Performance):** Nhúng VM Setun-70 vào một cảnh trò chơi 3D với 1,000 NPC chạy script logic tam phân cùng lúc; đo đạc độ trễ trung bình của mỗi frame (yêu cầu thời gian thực thi script $< 1.0\text{ ms}$/frame).
* **Test Case 4: Boot Thực nghiệm trên Bare-Metal:** Nạp hệ điều hành vi mô và runtime lên thiết bị phần cứng thực thụ, thực thi thành công chương trình tính toán ma trận TAFPU không qua OS trung gian.