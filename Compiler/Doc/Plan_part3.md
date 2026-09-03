### Kế hoạch Triển khai Giai đoạn 3: Hệ thống Toán Nâng cao, Động cơ Vật lý Chính xác & AI Tam phân

Giai đoạn 3 tập trung mở rộng năng lực tính toán của ngôn ngữ, đưa kiến trúc số học đại số TAFPU $\mathbb{Q}(\sqrt{3})$ và máy ảo Setun-70 vào giải quyết các bài toán tải nặng thực tế: đồ họa 3D không trôi tọa độ, động cơ vật lý không sai số tích lũy, suy luận mạng nơ-ron trọng số tam phân và tối ưu hóa hạ tầng JIT/SIMD.

---

### Module 1: Thư viện Đại số Tuyến tính & Ma trận Tam phân (`tmat`)

* **Cấu trúc Dữ liệu Ma trận TAFPU:**
* Xây dựng kiểu dữ liệu `tmat<Rows, Cols>` lưu trữ mảng tuyến tính các thanh ghi đại số $[A, B, S]$.


* Cung cấp các thao tác đại số ma trận: Chuyển vị (Transpose), Định thức (Determinant), Nghịch đảo đại số (Exact Inverse qua ma trận phụ hợp mà không làm tròn số).


* **Phép nhân Ma trận Không dùng Bộ nhân (Multiplication-free GEMM):**
* Tối ưu hóa phép nhân giữa ma trận trọng số tam phân $\{-1, 0, 1\}$ (chuẩn mô hình mạng nơ-ron 1.58-bit / BitNet) và vector kích hoạt TAFPU.


* Chuyển đổi toàn bộ vòng lặp nhân ma trận thành các thao tác cộng (`+`), trừ (`-`) và bỏ qua phần tử 0 (`zero-skip`), giảm độ phức tạp tính toán của ALU.


* **Biến đổi Affine Không Sai số:**
* Xây dựng ma trận biến đổi không gian $4 \times 4$ với các góc quay đặc biệt ($\pi/6$, $\pi/3$, $\pi/2$) được mã hóa chính xác bằng hệ số $\sqrt{3}$.





---

### Module 2: Động cơ Vật lý & Không gian Tọa độ 3D (Exact Physics & Geometry Engine)

* **Kiểu dữ liệu Vector 3D Đại số (`tvec3`):**
* Đóng gói vector tọa độ $(x, y, z)$ với $x, y, z \in \mathbb{Q}(\sqrt{3})$.


* Tính toán tích vô hướng (Dot product), tích có hướng (Cross product) và bình phương khoảng cách Euclidean $d^2 = \Delta x^2 + \Delta y^2 + \Delta z^2$ với sai số làm tròn $0\%$ tuyệt đối.




* **Phát hiện Va chạm Rời rạc Chính xác (Exact Collision Detection):**
* Hiện thực hóa Định lý Phân tách Trục (SAT - Separating Axis Theorem) dựa trên phép chiếu vector TAFPU.


* Triển khai phép thử định hướng (Orientation Tests) qua toán tử so sánh 3 ngôi `OP_CMP3`: Phân loại dứt khoát 3 trạng thái của điểm/vật thể (Nằm trong `+1`, Trên biên `0`, Nằm ngoài `-1`) mà không gặp hiện tượng nhiễu số học (Floating-point jittering).




* **Triệt tiêu Hiện tượng Trôi Tọa độ (Zero-Drift Spatial Coordinates):**
* Thiết lập hệ thống cập nhật vị trí và vận tốc động học liên tục trong không gian lớn mà không bị suy hao độ phân giải của lưới tọa độ.





---

### Module 3: Tối ưu Hóa Giải thuật Toán học Chuyên sâu & Hàm Siêu việt

* **Bộ chia TAFPU Tối ưu bằng CORDIC / Newton-Raphson Tam phân:**
* Hiện thực hóa thuật toán tính nghịch đảo mẫu số đại số $1 / (A_2^2 - 3B_2^2)$ bằng chuỗi dịch bit tam phân và cộng trừ lặp, thay thế hàm chia số nguyên tiêu chuẩn.




* **Đại số Quaternion Tam phân (`tquat`):**
* Biểu diễn phép xoay 3D qua Quaternion đại số $q = w + x\mathbf{i} + y\mathbf{j} + z\mathbf{k}$ với các thành phần thuộc $\mathbb{Q}(\sqrt{3})$.


* Bảo toàn chuẩn đơn vị $\Vert{}q\Vert{} = 1$ qua nhiều lần tích lũy phép xoay mà không cần gọi hàm chuẩn hóa căn bậc hai liên tục.


* **Bộ Hàm Kích hoạt Lượng tử hóa (Quantized Activation Functions):**
* Xây dựng các cổng kích hoạt mạng nơ-ron: Step function, Ternary Sign, và hàm xấp xỉ GeLU/SiLU trên lưới Weyl của TAFPU.





---

### Module 4: Tối ưu Hiệu năng Thực thi (SIMD Vectorization & LLVM Backend)

* **Vector hóa SIMD (AVX2 / AVX-512 Emulation):**
* Gom cụm tính toán: Đóng gói 4 thanh ghi TAFPU (hoặc nhiều Tryte 6-trit) vào thanh ghi vector 256-bit của CPU x86-64.


* Thực hiện song song các phép tính $(A_1 A_2 + 3B_1 B_2)$ và $(A_1 B_2 + A_2 B_1)$ trên nhiều luồng dữ liệu cùng một chu kỳ xung nhịp.




* **Backend Biên dịch LLVM IR:**
* Xây dựng module hạ tầng sinh mã trung gian LLVM IR (`llvm::IRBuilder`) từ cây cú pháp AST.
* Tận dụng trình tối ưu hóa của LLVM (O2/O3) để biên dịch mã nguồn `.taf` trực tiếp ra file thực thi nhị phân bản địa (Native Binary) cho kiến trúc x86-64 và ARM64.


* **JIT Compiler Cốt lõi:**
* Phát hiện các khối lệnh lặp tính toán tần suất cao (Hot-loops) trong bytecode Setun-70 và dịch động trực tiếp sang mã máy khi đang chạy.



---

### Module 5: Bộ Công cụ Phát triển & Hệ sinh thái Gỡ lỗi (Ecosystem & Tooling)

* **Setun Interactive REPL:**
* Giao diện dòng lệnh tương tác hỗ trợ tính toán trực tiếp các biểu thức đại số và hiển thị tức thì bộ ba $[A, B, S]$ cùng giá trị xấp xỉ.


* Tích hợp cờ theo dõi thanh ghi: `--trace-registers` để in trạng thái ngăn xếp sau mỗi lệnh.


* **Trit-by-Trit Visual Tracer:**
* Công cụ hiển thị trực quan luồng lan truyền Carry và trạng thái các Trit trong các phép toán cộng/trừ cơ sở của BTVP.




* **Language Server Protocol (LSP):**
* Cung cấp các tính năng IDE tiêu chuẩn cho file `.taf`: Báo lỗi cú pháp thời gian thực, tự động hoàn thành từ khóa (`branch3`, `tmat`, `taf3`, `tbool`), và hiển thị kiểu dữ liệu khi rê chuột.





---

### Module 6: Bộ Kiểm thử Tải nặng Giai đoạn 3 (Stress & Benchmark Suite)

* **Test Case 1: Ma trận Mạng Nơ-ron $1024 \times 1024$:** Đo đạc thông lượng tính toán (TFLOPS đại số) của phép nhân ma trận trọng số $\{-1, 0, 1\}$ với vector kích hoạt TAFPU.


* **Test Case 2: Mô phỏng Vật lý $1,000,000$ Chu kỳ:** Chạy mô phỏng tích phân chuyển động của 10,000 thực thể 3D, đo đạc độ sai lệch tọa độ tích lũy so với nghiệm giải tích tuyệt đối (yêu cầu sai số tích lũy = $0$).


* **Test Case 3: Benchmark SIMD vs Máy ảo Đơn luồng:** So sánh thời gian thực thi giữa bộ thông dịch Bytecode chuẩn và luồng vector hóa AVX2.


* **Test Case 4: Kiểm thử Trục căn thức CORDIC:** Đánh giá độ chính xác và số chu kỳ xung nhịp của thuật toán Newton-Raphson/CORDIC tam phân so với phép chia thông thường trên mẫu số $A_2^2 - 3B_2^2$.