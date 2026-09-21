# Hướng Dẫn Nghiệm Thu Tersun AI Runtime Trên Android (Termux ARM64)

```text
Document ID:      GUIDE-G7.1-ANDROID-20260921
Status:           READY FOR PHYSICAL VERIFICATION
Target Platform:  Android ARM64 (AArch64) via Termux
Package Archive:  tersun_android_bundle.zip (~56 KB)
```

Tài liệu này hướng dẫn chi tiết cách chạy và nghiệm thu **Tersun AI Runtime** trực tiếp trên điện thoại Android của bạn bằng **Termux**.

---

## 1. Chuẩn Bị Môi Trường Trên Android Termux (Chỉ làm 1 lần)

Mở ứng dụng **Termux** trên điện thoại và chạy lệnh sau để cài đặt trình biên dịch Clang, CMake, Ninja:

```bash
pkg update -y
pkg install -y clang cmake ninja unzip
```

Kiểm tra kiến trúc CPU thiết bị để xác nhận là ARM64:
```bash
uname -m
# Kết quả hiển thị: aarch64
```

---

## 2. Đưa Gói Bundle Vào Termux

File gói cài đặt đã được đóng gói sẵn tại máy tính của bạn:
* Đường dẫn trên máy: `d:\New PJ\Ternary\Compiler\tersun_android_bundle.zip` (hoặc trong `Code/tersun_android_bundle.zip`).

### Cách chuyển sang điện thoại:
1. Gửi file `tersun_android_bundle.zip` sang điện thoại (qua cáp USB, Zalo, Google Drive, hoặc Telegram).
2. Lưu file vào thư mục **Download** của điện thoại.
3. Trong Termux, cấp quyền truy cập bộ nhớ và giải nén:

```bash
termux-setup-storage
# Bấm "Cho phép" (Allow) trên màn hình điện thoại

mkdir -p ~/tersun_ai && cd ~/tersun_ai
cp /sdcard/Download/tersun_android_bundle.zip .
unzip -o tersun_android_bundle.zip
```

---

## 3. Biên Dịch & Chạy Nghiệm Thu Tự Động (Chỉ 1 Lệnh)

Chạy script tự động đã chuẩn bị sẵn trong bundle:

```bash
chmod +x build_termux.sh
./build_termux.sh
```

---

## 4. Hoặc Chạy Từng Lệnh Thủ Công Để Quan Sát Chi Tiết

### Bước 4.1: Biên dịch bằng Clang + Ninja
```bash
mkdir -p build && cd build
cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release
ninja
```
*(Quá trình biên dịch chỉ mất khoảng 10 - 15 giây vì đây là bản runner tối giản).*

### Bước 4.2: Kiểm tra năng lực phần cứng CPU Android
```bash
./tersun_ai_runner profile
```
*Kết quả kỳ vọng:*
```text
=== Active Target Architecture Profile ===
Architecture : aarch64
Cores        : 8 (hoặc số core của máy)
Vector Bytes : 16 bytes
AVX2 Support : DISABLED
NEON Support : ENABLED
Static Arena : DISABLED

Requested target : auto
Detected ISA     : aarch64+neon
Memory Profile   : desktop
Dispatch plan:
  K0 (Unpack/Decode) : scalar (LUT-direct)
  K2 (Dot Product)   : neon (128-bit vector)
  ...
```

### Bước 4.3: Chạy suy luận với Scalar Reference Oracle (Sprint 3 Test)
```bash
./tersun_ai_runner run ../mnist_bitnet.safetensors --target=scalar
```
*Kết quả đối chiếu chuẩn:*
* **Predicted Class**: `5` (ArgMax)
* **Logits**: `[30, 334, 82, 61, -50, 418, -30, -34, 16, 54]`
* **Heap Allocations**: `0`

### Bước 4.4: Chạy kiểm tra đối chiếu vi sai tự động (Cross-Check)
```bash
./tersun_ai_runner cross-check ../mnist_bitnet.safetensors
```
*Kết quả JSON chuẩn:*
```json
{
  "host_arch": "aarch64",
  "target_requested": "auto",
  "selected_backend": "scalar",
  "prediction": 5,
  "logits_checksum": "0xb48283d1",
  "heap_allocations": 0,
  "parity_status": "PASS"
}
```

> [!IMPORTANT]
> Giá trị **`logits_checksum: "0xb48283d1"`** và **`prediction: 5`** trên máy Android phải khớp **100% từng ký tự** với máy x86-64 trên PC của bạn!

### Bước 4.5: Đo kiểm hiệu năng tải cao (10,000 lượt suy luận)
```bash
./tersun_ai_runner benchmark ../mnist_bitnet.safetensors --iterations=10000 --export=android_bench.json
```
Lệnh này sẽ đo chính xác thời gian, độ trễ ($\mu\text{s}$) và số khung hình FPS trên CPU điện thoại của bạn, đồng thời xuất kết quả ra file `android_bench.json`.

---

## 5. Bàn Giao Kết Quả Về Để Niêm Phong
Sau khi chạy xong, bạn chỉ cần copy nội dung file `android_bench.json` hoặc kết quả terminal gửi vào cuộc trò chuyện này. Tôi sẽ tích hợp trực tiếp kết quả đo thực nghiệm trên phần cứng ARM thật của bạn vào báo cáo niêm phong **Gate 7.1 Sealed Artifacts**!
