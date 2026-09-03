 **Thiết kế Kỹ thuật (Technical Design Document)**

---

### 1. Kiến trúc Cấu trúc dữ liệu và Quản lý bộ nhớ (Memory & DSA)

Hệ thống tam phân đòi hỏi một cách tư duy khác về phân bổ bộ nhớ.

* **Đóng gói (Packing) Tryte:** Không dùng `int8_t` rời rạc cho mỗi Trit vì sẽ lãng phí cache. Một Tryte (6 trits) có $3^6 = 729$ trạng thái. Bạn có thể dùng `int16_t` trong C++ để lưu trữ trọn vẹn 1 Tryte (vì `int16_t` chứa được từ -32768 đến 32767).


* **Cấu trúc thanh ghi TAFPU:** Bộ ba $[A, B, S]$ cấu thành dạng $X = (A + B\sqrt{3}) \cdot 3^{S/2}$. Bạn thiết kế một `struct` sử dụng `int64_t` cho $A, B$ (hệ số nguyên tam phân cân bằng) và `int32_t` cho $S$. Padding của struct này trong C++ sẽ là 24 bytes.


* **Quản lý Cây cú pháp trừu tượng (AST):** Vì AST có thể phát triển rất lớn với các biểu thức toán học phức tạp, thay vì dùng `std::unique_ptr` gọi `new/delete` liên tục gây phân mảnh, hãy thiết kế một **Arena Allocator**. Cấp phát sẵn một vùng nhớ lớn (block) và "cắt" dần cho các AST Node. Khi biên dịch xong, chỉ cần giải phóng nguyên block đó trong $O(1)$.

### 2. Chi tiết Tầng Biên dịch (Compiler Pipeline)

Quá trình chuyển từ text sang Bytecode sẽ đi qua 3 pha chạy độc lập:

**Pha 2.1: Phân tích từ vựng (Lexer) và Bảng ký hiệu (Symbol Table)**

* Thay vì dùng Regex (rất chậm), hãy viết một Lexer quét chuỗi tuyến tính $O(N)$.
* Xây dựng **Symbol Table** bằng một Hash Map (`std::unordered_map`) để lưu trữ scope của biến. Khi khai báo `let x: taf3 = [1, 1, 0];`, Hash Map sẽ ánh xạ định danh `x` vào một địa chỉ ảo trên Stack của VM.

**Pha 2.2: Phân tích cú pháp (Pratt Parsing)**
Để xử lý độ ưu tiên của các phép toán đại số một cách thanh thoát (ví dụ phép nhân `*` ưu tiên hơn cộng `+`), sử dụng thuật toán Pratt Parser.

* Gán "Binding Power" (Độ ưu tiên kết hợp) cho từng toán tử. Ví dụ: `+` là 10, `*` là 20.
* Khi phân tích, vòng lặp đệ quy sẽ tự động rẽ nhánh để xây dựng cây nhị phân (Binary Tree) sao cho các nút phép nhân luôn nằm sâu hơn nút phép cộng.

**Pha 2.3: Sinh mã (Bytecode Emitter)**

* Duyệt cây AST theo thứ tự **Hậu tố (Post-order Traversal)**. Với một node `(A + B)`, bạn duyệt A (sinh lệnh `PUSH A`), duyệt B (sinh lệnh `PUSH B`), sau đó mới sinh lệnh `ADD` cho node hiện tại.
* Mã sinh ra được lưu vào một `std::vector<uint8_t>` (Mảng byte tuyến tính).

### 3. Chi tiết Tầng Thực thi (Setun-70 Virtual Machine)

**Thiết kế Vòng lặp Fetch-Decode-Execute:**
Đây là trái tim của máy ảo, cần tối ưu triệt để.

* Tránh dùng chuỗi lệnh `if-else` dài để giải mã Opcode. Hãy dùng **Computed Goto** (một tính năng của GCC/Clang) hoặc một mảng các con trỏ hàm (Function Pointers Array) để nhảy trực tiếp đến khối lệnh thực thi chỉ trong $O(1)$.

**Xử lý Ngoại lệ Đại số (Trục căn thức):**
Đối với phép chia TAFPU, mẫu số được tính bằng $A_2^2 - 3B_2^2$.

* Bạn cần viết logic kiểm tra ngoại lệ: Nếu $A_2^2 - 3B_2^2 = 0$, điều này tương đương với việc chia cho một phần tử đẳng hướng (isotropic element) trong trường đại số, máy ảo phải văng lỗi (Trap/Fault) ngay lập tức để tránh undefined behavior.
* Sai số làm tròn: Đảm bảo các phép cộng, trừ và nhân giữ nguyên tính chính xác tuyệt đối (0% sai số tích lũy). Tuy nhiên, phép chia sẽ cần lệnh `round()` sau khi nhân thừa số tỷ lệ $3^L$.



### 4. Quy trình Phát triển, DevOps & Môi trường Kiểm thử

Để dự án chuyên nghiệp và dễ quản lý, không nên code tất cả vào một file.

**Thiết lập CMake:**
Tách hệ thống thành các module thư viện tĩnh (Static Libraries):

* `libtafpu`: Xử lý thuần túy các thuật toán đại số và cấu trúc $[A, B, S]$.


* `libsetun_compiler`: Frontend chứa Lexer, Parser, AST.
* `libsetun_vm`: Backend chứa Stack, thanh ghi và vòng lặp thực thi.
* `setunc` (Executable): CLI tool kết nối compiler và vm lại với nhau.

**Môi trường Đóng gói & Tự động hóa:**
Thay vì cài đặt thư viện và test trực tiếp trên máy host, hãy thiết lập một môi trường biệt lập bằng **Docker**.

1. Viết một `Dockerfile` sử dụng image base là Ubuntu hoặc Alpine, cài sẵn GCC/Clang, CMake và GTest (Google Test).
2. Khi bạn viết xong giải thuật Dynamic Encoding hoặc phép nhân đại số, chỉ cần đưa code vào container để tự động build và chạy hàng loạt Unit Test đo độ lệch sai số (error margin) để chứng minh định lý phân bố đều Weyl.


3. Việc dùng Docker container giúp đảm bảo rằng trình thông dịch của bạn chạy ổn định dù bạn deploy nó lên nền tảng Linux nào.

**Đo đạc hiệu năng (Benchmarking):**
Để chứng minh VM của bạn hiệu quả, hãy viết một script chạy 100,000 chu kỳ lặp cho một biểu thức TAFPU phức tạp, sử dụng thư viện `<chrono>` của C++ để so sánh số microsecond thực thi giữa VM tam phân của bạn và phép toán IEEE 754 thông thường.