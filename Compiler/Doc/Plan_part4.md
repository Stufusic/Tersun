### Kế hoạch Triển khai Giai đoạn 4: Giao tiếp Đa ngôn ngữ (FFI), Thư viện Chuẩn Toàn diện, Tổng hợp Phần cứng (FPGA) & Đóng gói Hệ sinh thái

Giai đoạn 4 hoàn thiện ngôn ngữ thành một công cụ sẵn sàng sản xuất (Production-ready), cho phép nhúng engine vào các dự án phần mềm/game native, tự động hóa quản lý bộ nhớ, hỗ trợ tổng hợp phần cứng mạch số trực tiếp và phân phối toàn diện hệ sinh thái.

---

### Module 1: Giao tiếp Đa ngôn ngữ (C/C++ FFI) & Động cơ Nhúng (Embeddable VM)

* **Thiết kế Chuẩn C-ABI Tĩnh (`libsetun_ffi.h`):**
* Định nghĩa cấu trúc `TAF_Register_C` $[A, B, S]$ tương thích với chuẩn bộ nhớ C/C++.


* Cung cấp các hàm API C nguyên bản để truyền/nhận dữ liệu giữa host application và máy ảo: `setun_create_vm()`, `setun_load_bytecode()`, `setun_call_function()`, `setun_destroy_vm()`.


* **Cơ chế Nhúng vào Game Engine & Mô phỏng Native:**
* Cho phép tích hợp trực tiếp thư viện tĩnh `libsetun_vm.a` vào các dự án C++ lớn để xử lý logic toán học tọa độ hoặc tính toán sát thương độc quyền.


* Xây dựng bộ chuyển đổi dữ liệu hai chiều (Data Marshalling) không độ trễ giữa mảng float/double của C++ và mảng số thực đại số `taf3`.




* **Foreign Function Binding (Gọi C/C++ từ bên trong `.taf`):**
* Hỗ trợ từ khóa `extern` trong cú pháp ngôn ngữ để gọi trực tiếp các hàm hệ thống của C (như file I/O tốc độ cao, socket mạng).



---

### Module 2: Thư viện Chuẩn Toàn diện (`libstdtaf`)

* **Cấu trúc Dữ liệu Tam phân Chuyên biệt:**
* **`TernarySearchTree` (TST) / 2-3 Tree:** Cấu trúc cây tìm kiếm 3 nhánh tự nhiên tương thích với các toán tử so sánh 3 ngôi `OP_CMP3` (`<`, `==`, `>`).
* **`TArray<T>` & `THashMap<K, V>`:** Mảng động Tryte-aligned và bảng băm tối ưu hóa bộ đệm vi xử lý.


* **Hệ thống Xử lý Chuỗi & Mã hóa Văn bản Tam phân:**
* Định nghĩa chuẩn bảng mã ký tự dựa trên Tryte 6-trit (hỗ trợ 729 ký tự đại diện bao gồm bảng chữ cái mở rộng và ký hiệu toán học).


* Các hàm xử lý chuỗi: Cắt chuỗi, ghép nối, tìm kiếm mẫu tuyến tính dựa trên mảng Trit.


* **Thư viện Toán học Đại số Mở rộng:**
* Giải hệ phương trình tuyến tính bằng phương pháp khử Gauss-Jordan trực tiếp trên trường $\mathbb{Q}(\sqrt{3})$ với độ chính xác $0\%$ sai số tích lũy.


* Bộ giải đa thức bậc 2 và bậc 3 với nghiệm đại số chính xác biểu diễn qua bộ ba $[A, B, S]$.





---

### Module 3: Bộ Thu Gom Rác Tam phân (Tri-Color Garbage Collector)

* **Mô hình Thu Gom Rác 3 Màu Tự nhiên (Tri-Color Marking):**
* Ánh xạ trực tiếp 3 trạng thái của thuật toán GC lên 3 giá trị Trit của hệ tam phân cân bằng:


* **`Trạng thái -1 (White / Unreachable)`:** Đối tượng chưa được duyệt, có nguy cơ bị thu hồi.
* **`Trạng thái 0 (Grey / Discovered)`:** Đối tượng đã được phát hiện nhưng các con trỏ bên trong nó chưa được quét.
* **`Trạng thái +1 (Black / Preserved)`:** Đối tượng còn sống và tất cả các đối tượng tham chiếu tới đã được quét hoàn tất.




* **Quản lý Bộ nhớ Khối (Tryte-Slab Allocator):**
* Cung cấp bộ cấp phát bộ nhớ theo các kích thước block cố định để triệt tiêu phân mảnh bộ nhớ (Memory Fragmentation) trong quá trình thực thi liên tục nhiều chu kỳ.



---

### Module 4: Backend Tổng hợp Phần cứng (Hardware Synthesis & FPGA IP-Core)

* **Trình biên dịch Chuyển mã (AST to Verilog/VHDL Emitter):**
* Xây dựng backend đặc biệt trong `setunc` với cờ `--emit-verilog`.
* Tự động chuyển đổi các biểu thức toán học và hàm tính toán TAFPU thành mã mô tả phần cứng RTL (Register-Transfer Level).


* **Thiết kế Khối Phần cứng TAFPU ALU Core trên FPGA:**
* Hiện thực hóa mạch nhân đại số phần cứng thực thi song song $(A_1 A_2 + 3B_1 B_2)$ và $(A_1 B_2 + A_2 B_1)$ trong 1 chu kỳ xung nhịp.


* Thiết kế khối dịch bit tam phân và căn chỉnh số mũ $S$ bằng mạng logic kết hợp (Combinational Logic).





---

### Module 5: Trình Quản lý Gói & Công cụ Đóng gói Phân phối (`tpm`)

* **Trình quản lý Gói `tpm` (Ternary Package Manager):**
* Quản lý tệp cấu hình dự án `setun.toml` (định nghĩa metadata, phiên bản compiler, dependencies).
* Lệnh tải và biên dịch tự động các thư viện bên thứ ba: `tpm install <package_name>`, `tpm build`, `tpm test`.


* **Đóng gói Phân phối Bộ Công cụ (Toolchain Distribution):**
* Tạo kịch bản đóng gói bộ nhị phân độc lập chứa đầy đủ: `setunc` (Compiler), `setunvm` (Virtual Machine), `setun-repl` (Interactive Console), `tpm` (Package Manager), và `libstdtaf`.
* Hỗ trợ cài đặt đa nền tảng (Linux x86-64, ARM64/Apple Silicon) và cung cấp Docker image chuẩn hóa cho môi trường CI/CD.



---

### Module 6: Bộ Kiểm thử Mở rộng Giai đoạn 4 (System & Production Test Suite)

* **Test Case 1: Nhúng FFI C++ (End-to-End Integration):** Viết chương trình C++ mẫu gọi hàm tính toán khoảng cách 3D từ tệp bytecode `.tbc` của máy ảo Setun-70, kiểm tra tính toàn vẹn của dữ liệu và bộ nhớ.


* **Test Case 2: Stress-test Bộ Thu Gom Rác Tri-Color:** Cấp phát và hủy liên tục 1,000,000 đối tượng động trong script `.taf`, đo đạc rò rỉ bộ nhớ (Memory Leaks = 0 bytes) qua Valgrind/ASan.
* **Test Case 3: Mô phỏng RTL Verilog:** Nạp mã Verilog do trình biên dịch sinh ra vào phần mềm mô phỏng phần cứng (như ModelSim / Verilator) để xác thực dạng sóng thời gian thực của các phép toán TAFPU.


* **Test Case 4: Quản lý Gói `tpm`:** Kiểm thử quá trình nạp nhiều module thư viện lồng nhau và biên dịch ra file nhị phân hoàn chỉnh.