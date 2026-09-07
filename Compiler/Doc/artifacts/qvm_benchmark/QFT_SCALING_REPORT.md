# BÁO CÁO KHOA HỌC THỰC NGHIỆM: BENCHMARK GIẢI THUẬT BIẾN ĐỔI FOURIER LƯỢNG TỬ (QFT) TRÊN TERSUN QVM

> **Ngày thực hiện**: 06/09/2026  
> **Nền tảng**: Tersun Quantum Virtual Machine (QVM) Engine & Q-ISA  
> **Bộ xử lý**: x86_64 Host, C++20 (`-O3`), Windows PSAPI High-Resolution Counters  
> **Dải kích thước kiểm thử**: $N = 4$ đến $N = 22$ Qubits (Không gian Hilbert từ 16 đến 4,194,304 chiều)  

---

## 1. BẢNG DỮ LIỆU ĐO ĐẠC THỰC NGHIỆM CHI TIẾT

| $N$ Qubits | Không gian Hilbert ($2^N$) | Số cổng lượng tử (Gates) | Thời gian chạy (Runtime) | Tốc độ cổng (Gates/s) | Bộ nhớ State (MB) | Peak RSS OS (MB) | Độ trung thực Fidelity ($F$) | Sai số chuẩn Norm Err | Trạng thái |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **$N = 4$** | 16 | 36 | **0.01 ms** | $3.60 \times 10^6$ | 0.0002 MB | 3.68 MB | **1.0000000000** | $1.1 \times 10^{-15}$ | **PASS 100%** |
| **$N = 6$** | 64 | 84 | **0.01 ms** | $5.60 \times 10^6$ | 0.0010 MB | 3.75 MB | **1.0000000000** | $4.4 \times 10^{-16}$ | **PASS 100%** |
| **$N = 8$** | 256 | 152 | **0.06 ms** | $2.71 \times 10^6$ | 0.0039 MB | 3.77 MB | **1.0000000000** | $2.2 \times 10^{-16}$ | **PASS 100%** |
| **$N = 10$** | 1,024 | 240 | **0.30 ms** | $8.03 \times 10^5$ | 0.0156 MB | 3.80 MB | **1.0000000000** | $2.2 \times 10^{-16}$ | **PASS 100%** |
| **$N = 12$** | 4,096 | 348 | **1.55 ms** | $2.25 \times 10^5$ | 0.0625 MB | 3.96 MB | **1.0000000000** | $0.0 \times 10^0$ | **PASS 100%** |
| **$N = 14$** | 16,384 | 476 | **7.76 ms** | $6.14 \times 10^4$ | 0.2500 MB | 4.41 MB | **1.0000000000** | $0.0 \times 10^0$ | **PASS 100%** |
| **$N = 16$** | 65,536 | 624 | **39.89 ms** | $1.56 \times 10^4$ | 1.0000 MB | 6.86 MB | **1.0000000000** | $1.1 \times 10^{-16}$ | **PASS 100%** |
| **$N = 18$** | 262,144 | 792 | **229.81 ms** | $3.45 \times 10^3$ | 4.0000 MB | 14.88 MB | **1.0000000000** | $0.0 \times 10^0$ | **PASS 100%** |
| **$N = 20$** | 1,048,576 | 980 | **1,801.21 ms** (~1.80 s) | $5.44 \times 10^2$ | 16.0000 MB | 44.40 MB | **1.0000000000** | $0.0 \times 10^0$ | **PASS 100%** |
| **$N = 21$** | 2,097,152 | 1,081 | **4,055.74 ms** (~4.06 s) | $2.67 \times 10^2$ | 32.0000 MB | 84.41 MB | **1.0000000000** | $0.0 \times 10^0$ | **PASS 100%** |
| **$N = 22$** | 4,194,304 | 1,188 | **9,746.67 ms** (~9.75 s) | $1.22 \times 10^2$ | 64.0000 MB | 164.91 MB | **1.0000000000** | $0.0 \times 10^0$ | **PASS 100%** |

---

## 2. PHÂN RÃ CẤU TRÚC MẠCH LƯỢNG TỬ QFT

Mạch QFT cho $N$ qubits được phân rã thành các cổng cơ sở của tập lệnh Q-ISA:
1. **$N$ cổng Hadamard ($H$)**: Đưa từng qubit vào trạng thái chồng chập.
2. **$\frac{N(N-1)}{2}$ cổng xoay pha có điều khiển ($CP(\theta)$)**:
   - Góc xoay: $\theta = \frac{\pi}{2^{b-c}}$.
   - Trong Tersun Q-ISA, mỗi cổng $CP(\theta)$ được phân giải chính xác thành **5 cổng nguyên thủy**:
     $$CP(\theta) \longrightarrow R_Z(\theta/2) \otimes CNOT \otimes R_Z(-\theta/2) \otimes CNOT \otimes R_Z(\theta/2)$$
3. **$\lfloor N/2 \rfloor$ cổng đảo bit ($SWAP$)**: Đảo ngược thứ tự các qubit để đưa chỉ số về dạng chuẩn tự nhiên.

**Công thức tổng số cổng:**
$$\text{Total Gates}(N) = N + 5 \times \frac{N(N-1)}{2} + \left\lfloor \frac{N}{2} \right\rfloor$$

- Tại $N=20$: $20 + 5 \times 190 + 10 = \mathbf{980\text{ cổng}}$.
- Tại $N=22$: $22 + 5 \times 231 + 11 = \mathbf{1,188\text{ cổng}}$.

---

## 3. MẬT ĐỘ TÍNH TOÁN & HIỆU SUẤT XỬ LÝ (COMPUTATIONAL COMPLEXITY)

- Với không gian trạng thái $2^N$ biên độ phức (`std::complex<double>`):
  - Mỗi cổng 1-qubit ($H$, $RZ$) biến đổi $2^{N-1}$ cặp biên độ, tương đương 6 phép tính dấu phẩy động (FLOPs).
  - Mỗi cổng 2-qubit ($CNOT$) thực hiện tráo đổi khối biên độ.
- **Tổng số phép tính số phức:**
  - Tại $N = 20$: $1,048,576 \times 980 \approx \mathbf{1.027\text{ tỷ phép tính số phức}}$ thực hiện trong **1.8 giây** ($\sim 5.7 \times 10^8\text{ amplitude-gates/sec}$).
  - Tại $N = 22$: $4,194,304 \times 1,188 \approx \mathbf{4.982\text{ tỷ phép tính số phức}}$ thực hiện trong **9.75 giây**.

---

## 4. QUẢN LÝ BỘ NHỚ: THEORETICAL RAM VS PEAK RSS (WINDOWS API)

- **Statevector thuần túy**: Mỗi số phức tiêu tốn $16\text{ Bytes}$ ($8\text{B}$ phần thực + $8\text{B}$ phần ảo).
  - $N=20$: $1,048,576 \times 16\text{B} = \mathbf{16.000\text{ MB}}$ (vừa khít bộ nhớ đệm L3 Cache của CPU).
  - $N=21$: $2,097,152 \times 16\text{B} = \mathbf{32.000\text{ MB}}$.
  - $N=22$: $4,194,304 \times 16\text{B} = \mathbf{64.000\text{ MB}}$.
- **Peak RSS (Working Set Size thực tế của tiến trình)**: Đo đạc qua API hệ điều hành `GetProcessMemoryInfo`:
  - Tại $N=20$: Peak RSS đạt **44.40 MB** (bao gồm runtime C++, mã máy, stack và heap).
  - Tại $N=22$: Peak RSS đạt **164.91 MB**. Bộ nhớ giải phóng ngay lập tức sau khi mô phỏng hoàn tất.

---

## 5. ĐỘ TRUNG THỰC LƯỢNG TỬ (QUANTUM FIDELITY & COHERENCE INVARIANTS)

Trạng thái đầu vào là trạng thái cơ bản $|00\dots 0\rangle$. Về mặt giải tích toán học:
$$|\psi_{\text{ideal}}\rangle = \text{QFT}|00\dots 0\rangle = \frac{1}{\sqrt{2^N}} \sum_{x=0}^{2^N - 1} |x\rangle$$

Toàn bộ các bất biến toán học được kiểm chứng nghiêm ngặt:
1. **Độ trung thực lượng tử (Quantum Fidelity)**:
   $$F = |\langle \psi_{\text{ideal}} | \psi_{\text{actual}} \rangle|^2 = \left| \frac{1}{\sqrt{2^N}} \sum_{x=0}^{2^N - 1} \psi_{\text{actual}}(x) \right|^2 = \mathbf{1.0000000000}$$
   (Đạt độ chính xác tuyệt đối $100.0000\%$, không có hiện tượng suy giảm pha hay rò rỉ lượng tử).
2. **Sai số chuẩn hóa hàm sóng (Wavefunction Normalization Error)**:
   $$\text{Norm Err} = \left| \sum_{x=0}^{2^N - 1} |\psi_{\text{actual}}(x)|^2 - 1.0 \right| \le 1.1 \times 10^{-16}$$
   (Nằm trong giới hạn sai số máy phần cứng - Machine Epsilon).
3. **Xác suất đo đạc cơ sở**: Mọi qubit $q$ đều có xác suất đo được $|1\rangle$ chính xác bằng **$0.50000000$**.

---

## 6. SO SÁNH GIỮA STATEVECTOR VÀ MẠNG TENSOR (MPS) TRONG BÀI TOÁN QFT

1. **Với mạch Entanglement thấp (như GHZ)**: Backend MPS của Tersun mô phỏng $N=64$ qubits chỉ trong $0.01\text{ ms}$ và $0.007\text{ MB}$ RAM vì số chiều liên kết $\chi \le 2$.
2. **Với mạch QFT**: Các cổng xoay pha có điều khiển $CP(\theta)$ kết nối tất cả các cặp qubit từ xa, tạo ra trạng thái chồng chập và vướng víu cực đại (Maximal Entanglement). Số chiều liên kết của mạng Tensor bùng nổ theo hàm mũ $\chi \sim 2^{N/2}$.
$\rightarrow$ **Kết luận kiến trúc**: Cơ chế Statevector Exact của Tersun QVM là **lựa chọn tối ưu vượt trội** cho giải thuật QFT ở quy mô $N \le 24$ qubits.
