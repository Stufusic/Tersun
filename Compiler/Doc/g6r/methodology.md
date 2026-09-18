# G6R.1 Forensics Methodology & Empirical Standards

Tài liệu này xác lập quy chuẩn phương pháp luận điều tra thực nghiệm (Empirical Forensics Methodology) áp dụng cho Tersun Gate 6 Rebuild 1 (G6R.1).

---

## 1. Tôn chỉ Cốt lõi: OBSERVE, MEASURE, ISOLATE, CLASSIFY

Khác với các đợt phát triển tính năng, G6R.1 không phải là giai đoạn tối ưu hóa code. Mọi hành động can thiệp mã nguồn runtime nhằm "làm cho nhanh hơn" trong giai đoạn này đều bị **cấm tuyệt đối**.
Mục tiêu là xây dựng bản đồ giải phẫu (Anatomical Map) chính xác 100% về mặt định lượng của Tersun VM và JIT.

### 7 Nguyên tắc Bất biến:
1. **Semantic & Baseline Freeze**: Giữ nguyên toàn bộ logic runtime của Gate 6 đã đạt chuẩn.
2. **Benchmark Invariance**: Mã nguồn benchmark của 4 workload chuẩn ($W1..W4$) phải giống nhau 100% giữa tất cả các execution modes.
3. **Counter-Backed Conclusions**: Mọi kết luận nguyên nhân phải có counter/telemetry cụ thể chứng minh, không được phỏng đoán dựa trên wall-clock.
4. **Independent Workload Investigation**: Mỗi workload đại diện cho một đặc tính tính toán riêng biệt và phải được mổ xẻ độc lập ($W3 \rightarrow W4 \rightarrow W1 \rightarrow W2$) trước khi rút ra mẫu số chung.
5. **Cold vs Warm Rigorous Separation**: Tuyệt đối không tính gộp thời gian khởi tạo VM / nạp module / cold compilation vào thời gian thực thi ổn định.
6. **Statistically Sound Sampling**: Mỗi cấu hình đo tối thiểu $N=20$ lần warm runs, sử dụng Median và P95 làm mốc chuẩn, theo dõi chặt chẽ hệ số biến thiên ($CV\% \le 5\%$).
7. **Single-Variable A/B Isolation**: Mỗi thí nghiệm chẩn đoán chỉ được phép thay đổi duy nhất một hệ thống con (One major subsystem at a time) để bảo đảm quan hệ nhân quả (Causality).

---

## 2. Ma trận Thực thi 5 Chế độ (Execution Modes $M0..M4$)

| Mode ID | Tên Chế độ | Cờ Thực thi (`setunc run`) | Đặc tính Kỹ thuật |
| :--- | :--- | :--- | :--- |
| **$M0$** | Pure Interpreter | `--interp --dispatch=switch --opt-v3` | Vòng lặp Switch dispatch truyền thống, không cache register, không superinstruction |
| **$M1$** | Optimized Interpreter | `--interp --dispatch=cached --opt-all` | Direct-threaded / Register-cached dispatch + TOS caching + bytecode fusion |
| **$M2$** | Baseline JIT | `--jit-tier-a` | JIT Tier-1 compiler (biên dịch machine code nhanh, hạ thấp dispatch overhead) |
| **$M3$** | Auto-Tier JIT | `--jit` | Đa tầng thích ứng (Tier 0 $\rightarrow$ Tier 1 $\rightarrow$ Tier 2 OSR loop promotion) |
| **$M4$** | Native AOT | `compile --native -O3` | LLVM / Native backend biên dịch trực tiếp ra mã máy x86-64 tối ưu hóa hoàn toàn |

---

## 3. Quy chuẩn Đánh giá Thống kê

Với vector thời gian $T = [t_1, t_2, \dots, t_N]$ ($N \ge 20$):
- **Median ($t_{\text{med}}$)**: Trung vị thời gian, loại bỏ các outlier do ngắt hệ điều hành.
- **P95 ($t_{\text{p95}}$)**: Phân vị thứ 95, phản ánh độ trễ trần (Tail Latency).
- **Standard Deviation ($\sigma$) & Mean ($\mu$)**: Độ lệch chuẩn và giá trị trung bình.
- **Coefficient of Variation ($CV\% = \frac{\sigma}{\mu} \times 100$)**:
  - $CV\% \le 5\%$: Đo lường đạt chuẩn ổn định cao.
  - $CV\% > 10\%$: Cảnh báo nhiễu nền, kích hoạt quy trình kiểm tra thermal throttling, CPU frequency scaling, hoặc GC spikes.
- **95% Confidence Interval**:
  $$CI_{95} = \mu \pm t_{\text{crit}} \times \frac{\sigma}{\sqrt{N}}$$

---

## 4. Mô hình Phân rã Ngân sách Hiệu năng (Performance Budget Reconciliation)

Với khoảng cách chênh lệch giữa VM và Native AOT:
$$\Delta_{\text{Gap}} = t_{\text{VM (Median)}} - t_{\text{AOT (Median)}}$$

Khoảng cách này phải được giải trình đầy đủ thông qua 5 thành phần có counter chứng minh:
$$\Delta_{\text{Gap}} = T_{\text{Dispatch}} + T_{\text{Memory/Array}} + T_{\text{Fusion/Stack Loss}} + T_{\text{JIT Tax}} + T_{\text{Other}}$$

Nếu tổng các thành phần giải thích được nhỏ hơn 75% khoảng cách thực tế, quá trình điều tra pháp y được coi là **chưa hoàn tất** và phải tiếp tục đo sâu hơn.
