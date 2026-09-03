# Đề Xuất Cú Pháp Ngôn Ngữ Toàn Diện: Setun-70 & TAFPU 2.0 (Next-Gen)
## *Tốc độ Native C++ • Đa Kiến Trúc (ARM / Intel / AMD / RISC-V / Wasm) • Trải nghiệm Lập trình Python • Hướng Đối Tượng & An toàn Java*

---

## 1. Triết Lý Thiết Kế Cú Pháp (Syntax Design Philosophy)
Ngôn ngữ **Setun 2.0** được thiết kế dựa trên 4 trụ cột cú pháp:
1. **Tinh khiết & Trực quan (Pythonic Elegance)**: Không dấu ngoặc chấm phẩy rườm rà không cần thiết, tự động suy luận kiểu (Type Inference), chuỗi nội suy `f"..."`, mảng đa năng và lambda closures.
2. **Kiểm soát Hiệu năng & Bộ nhớ Tuyệt đối (C++ Zero-Cost Control)**: Phân định rạch ròi kiểu giá trị `struct` (Stack/Registers, $0\text{ns}$ GC) và kiểu tham chiếu `class` (Heap/GC); tính toán compile-time `comptime`.
3. **Mô hình Hướng Đối Tượng & Module Chặt Chẽ (Java Robustness & Safety)**: `interface` với default methods, `enum` dạng Algebraic Data Types (ADT), hệ thống gói `import setun.math.*`.
4. **Bản Sắc Tam Phân Độc Bản (Native Balanced Ternary & TAFPU $\mathbb{Q}(\sqrt{3})$)**: Cú pháp số vô tỷ đại số bậc nhất, rẽ nhánh 3 hướng 1 chu kỳ `branch`, logic Kleene tam phân và toán tử ma trận AI BitNet `@`.

---

## 2. Chi Tiết Các Cấu Trúc Cú Pháp Đề Xuất

### 2.1. Hệ Thống Khai Báo Biến & Kiểu Dữ Liệu Tĩnh / Suy Luận
```setun
// 1. Khai bao bien tu dong suy luan kieu (Type Inference)
let name = "Setun-70";            // string
let count = 42;                    // int (64-bit signed)
let ratio = 3.14159;               // float (64-bit IEEE 754)
let is_ready = true;               // bool

// 2. Kieu Tam phan & Tryte (Balanced Ternary First-Class)
let state: trit = 1;               // trit: 1 (True), 0 (Unknown), T hoac -1 (False)
let packed: tryte = @10T1;         // tryte: 6-trit gia tri [-364, 364]

// 3. So Thuc Dai So TAFPU Q(sqrt(3)) - 0% Sai so
let x: taf3 = [1, 1, 0];           // (1 + 1*sqrt(3)) * 3^(0/2)
let y = [1, -1, 0];                // Tu hieu kieu taf3
let exact_const = 14 + 25_rt3;     // Cu phap viet tat cua [14, 25, 0]

// 4. Hang so bat bien (Immutable Constants)
const MAX_ENTITIES = 100_000;
const GRAVITY_TAF: taf3 = [98, 0, -1]; // 9.8 duoc ma hoa chinh xac
```

---

### 2.2. Khớp Mẫu Tam Phân & Rẽ Nhánh 3 Hướng (Ternary Branching & Pattern Matching)

#### A. Rẽ nhánh 3 hướng tối ưu 1 chu kỳ CPU (`branch`):
```setun
let cmp = energy_a <=> energy_b; // Tra ve: -1 neu a < b, 0 neu a == b, +1 neu a > b

branch (cmp) {
    -1 -> { println("Nang luong A thap hon B!"); }
     0 -> { println("Nang luong A can bang B!"); }
    +1 -> { println("Nang luong A vuot troi B!"); }
}
```

#### B. Khớp mẫu cấu trúc nâng cao (`match` kiểu Rust/Python + Java 21):
```setun
enum SensorStatus {
    Offline,
    Calibrating(int),
    Online(tvec3, taf3)
}

match (sensor) {
    case SensorStatus.Offline => {
        reboot_subsystem();
    }
    case SensorStatus.Calibrating(percent) if percent < 50 => {
        println(f"Dang khoi dong cham: {percent}%");
    }
    case SensorStatus.Online(pos, accuracy) => {
        track_target(pos, accuracy);
    }
    case _ => { println("Trang thai khong xac dinh"); }
}
```

---

### 2.3. Hướng Đối Tượng: `struct` (Value Type) vs `class` (Reference Type) & `interface`

```setun
// 1. Interface dinh nghia hop dong da hinh (giong Java)
interface Renderable {
    fn draw(canvas: &mut Canvas);
    
    // Default method
    fn get_layer() -> int {
        return 0; // Layer mac dinh
    }
}

// 2. Struct: Kieu gia tri, cap phat Stack, truyen gia tri, 0ns GC overhead (giong C++)
struct Transform3D {
    pub let position: tvec3;
    pub let rotation: tquat;
    pub let scale: taf3;

    // Constructor factory
    fn identity() -> Transform3D {
        return Transform3D {
            position: tvec3.zero(),
            rotation: tquat.identity(),
            scale: [1, 0, 0]
        };
    }

    // Phuong thuc inline khong ton chi phi goi ham
    pub fn translate(&mut this, delta: tvec3) {
        this.position = this.position + delta;
    }
}

// 3. Class: Kieu tham chieu, cap phat Heap do Tri-Color GC quan ly (giong Java/Python)
class SpaceCruiser : Renderable {
    pub let name: string;
    pub let transform: Transform3D;
    private let shield_hp: taf3;
    private let is_destroyed: bool;

    fn new(name: string, start_pos: tvec3) {
        this.name = name;
        this.transform = Transform3D.identity();
        this.transform.position = start_pos;
        this.shield_hp = [100, 50, 0];
        this.is_destroyed = false;
    }

    // Cai dat Interface
    fn draw(canvas: &mut Canvas) {
        canvas.draw_mesh(this.name, this.transform);
    }

    // Phuong thuc xu ly sat thuong dai so 0% sai so
    pub fn apply_hit(&mut this, dmg: taf3) -> trit {
        this.shield_hp = this.shield_hp - dmg;
        let status = this.shield_hp <=> [0, 0, 0];
        
        branch (status) {
            -1 -> { this.is_destroyed = true; return -1; }
             0 -> { return 0; }
            +1 -> { return +1; }
        }
    }
}
```

---

### 2.4. Đại Số Tuyến Tính & AI BitNet 1.58-bit Cấp Ngôn Ngữ (Tensor & AI Ops)

```setun
// 1. Khai bao Vector va Ma tran truc quan
let p1: tvec3 = [10, 20, 0];
let p2: tvec3 = [13, 24, 0];

// Khoang cach Euclidean 0% sai so tich luy
let dist_sq: taf3 = p1 .distance_sq p2; // Ket qua [25, 0, 0] = 25

// Tich co huong (Cross product)
let normal = p1 .cross p2;

// 2. Ma tran trong so Tam phan BitNet (Weights in {-1, 0, 1})
let W: tmat<3, 3> = mat![
    [ 1,  0, -1],
    [ 0,  1,  1],
    [-1,  1,  0]
];

let x_in: tvec3 = [1, 1, 0]; // (1 + sqrt(3))

// 3. Toan tu '@' Nhan Ma Tran khong dung bo nhan (Multiplication-free GEMM)
let y_out = W @ x_in; 
// Trinh bien dich tu dong toi uu thanh phep cong/tru tren thanh ghi SIMD AVX-512/NEON
```

---

### 2.5. Trải Nghiệm Lập Trình Pythonic (DX & Syntax Sugar)

```setun
// 1. String Interpolation (f-strings)
let score = 9850;
let player = "Commander Shephard";
println(f"Player: {player} | Score: {score} | Pos: {p1}");

// 2. Multi-return & Tuples Unpacking
fn get_player_stats() -> (int, taf3, string) {
    return (100, [50, 25, 0], "Active");
}
let (health, shield, status_str) = get_player_stats();

// 3. List Comprehensions & Lambda Streams
let raw_data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// Loc cac phan tu chan va nhan doi
let processed = [x * 2 for x in raw_data if x % 2 == 0];

// Functional Stream API
let sum_val = raw_data
    .filter(|x| x > 5)
    .map(|x| x * [1, 1, 0]) // Map sang so dai so taf3
    .reduce([0, 0, 0], |acc, val| acc + val);

// 4. Safe Navigation & Null Coalescing
let guild_leader_name = ship?.captain?.guild?.name ?? "No Guild";
```

---

### 2.6. Tính Toán Lúc Biên Dịch (Compile-Time Metaprogramming - `comptime`)

```setun
// Ham chay hoan toan tai thoi diem bien dich
comptime fn generate_trig_lookup_table(steps: int) -> Array<taf3> {
    let table = Array<taf3>();
    for i in 0..steps {
        // Tinh toan chinh xac luong giac tren truong Q(sqrt(3))
        let angle_val = encode_dynamic(3.14159265 * i / steps);
        table.push(angle_val);
    }
    return table;
}

// Mang duoc nạp thang vao Read-Only Data Section cua file .exe / binary
const SINE_TABLE: Array<taf3> = comptime generate_trig_lookup_table(360);
```

---

### 2.7. Lập Trình Bất Đồng Bộ & Concurrency 3 Mức Ưu Tiên

```setun
// Luong uu tien cao (+1: Physics & Combat) - Microkernel Dispatcher uu tien truoc
async(priority: +1) fn physics_substep(world: &mut World) {
    world.integrate_zero_drift(1000);
}

// Luong uu tien thap (-1: Cloud Save & Analytics)
async(priority: -1) fn sync_cloud_telemetry(data: string) {
    await http_client.post("https://api.setun.io/v1/telemetry", data);
}

// Giao tiep giua cac Task qua Kenh Tam Phan (Ternary Channel)
fn main() {
    let chan = Channel<CombatEvent>(buffer_size: 1024);
    
    spawn async {
        while let Some(evt) = chan.receive().await {
            match (evt) {
                case CombatEvent.Explosion(pos) => play_sound(pos);
                case CombatEvent.Hit(dmg)       => update_ui(dmg);
            }
        }
    };
}
```

---

## 3. Ngữ Pháp Chuẩn EBNF Nâng Cấp (EBNF Grammar v2.0)

```ebnf
Program         ::= { ImportStmt | DeclStmt } ;

ImportStmt      ::= "import" QualifiedName [ "::" "*" ] ";" ;
QualifiedName   ::= IDENTIFIER { "." IDENTIFIER } ;

DeclStmt        ::= VarDecl | FnDecl | StructDecl | ClassDecl | InterfaceDecl | EnumDecl ;

VarDecl         ::= ( "let" | "const" ) IDENTIFIER [ ":" Type ] [ "=" Expression ] ";" ;

StructDecl      ::= "struct" IDENTIFIER [ ":" InterfaceList ] "{" { StructMember } "}" ;
ClassDecl       ::= "class" IDENTIFIER [ "extends" IDENTIFIER ] [ "implements" InterfaceList ] "{" { ClassMember } "}" ;
InterfaceDecl   ::= "interface" IDENTIFIER "{" { InterfaceMethod } "}" ;
EnumDecl        ::= "enum" IDENTIFIER "{" { EnumVariant } "}" ;

Branch3Stmt     ::= "branch" "(" Expression ")" "{"
                      ( "-1" | "T" ) ( ":" | "->" | "=>" ) Statement
                      ( "0" )        ( ":" | "->" | "=>" ) Statement
                      ( "+1" | "1" ) ( ":" | "->" | "=>" ) Statement
                    "}" ;

MatchStmt       ::= "match" "(" Expression ")" "{" { MatchArm } "}" ;
MatchArm        ::= "case" Pattern [ "if" Expression ] "=>" ( Statement | BlockStmt ) ;

Type            ::= "trit" | "tryte" | "taf3" | "int" | "float" | "bool" | "string"
                  | "tvec3" | "tmat" "<" INT "," INT ">" | "tquat"
                  | "&" [ "mut" ] Type | IDENTIFIER [ "<" TypeList ">" ] ;

Expression      ::= AssignmentExpr ;
AssignmentExpr  ::= TernaryCmpExpr [ ( "=" | "+=" | "-=" | "*=" | "/=" ) AssignmentExpr ] ;
TernaryCmpExpr  ::= LogicalOrExpr [ "<=>" LogicalOrExpr ] ;
LogicalOrExpr   ::= LogicalAndExpr { ( "or" | "max" ) LogicalAndExpr } ;
LogicalAndExpr  ::= EqualityExpr { ( "and" | "min" ) EqualityExpr } ;
EqualityExpr    ::= RelationalExpr { ( "==" | "!=" ) RelationalExpr } ;
RelationalExpr  ::= AdditiveExpr { ( "<" | "<=" | ">" | ">=" ) AdditiveExpr } ;
AdditiveExpr    ::= MultiplicativeExpr { ( "+" | "-" ) MultiplicativeExpr } ;
MultiplicativeExpr ::= MatrixMulExpr { ( "*" | "/" | "%" ) MatrixMulExpr } ;
MatrixMulExpr   ::= UnaryExpr { "@" UnaryExpr } ; // Multiplication-free GEMM
UnaryExpr       ::= ( "-" | "~" | "not" | "&" | "&mut" ) UnaryExpr | PostfixExpr ;
PostfixExpr     ::= PrimaryExpr { MemberAccess | MethodCall | IndexAccess | SafeNav } ;
MemberAccess    ::= "." IDENTIFIER ;
MethodCall      ::= "(" [ ArgList ] ")" ;
IndexAccess     ::= "[" Expression [ ".." Expression ] "]" ;
SafeNav         ::= "?." IDENTIFIER ;
```

---

## 4. Ma Trận Đa Kiến Trúc & Biên Dịch Đa Nền Tảng (Cross-Architecture Matrix)

```
┌────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                 SETUN FRONTEND (Lexer, Parser, HIR, Type Checker)                      │
└───────────────────────────────────────────────────┬────────────────────────────────────────────────────┘
                                                    │
                         ┌──────────────────────────┴──────────────────────────┐
                         ▼                                                     ▼
┌──────────────────────────────────────────────────┐ ┌──────────────────────────────────────────────────┐
│             LLVM AOT NATIVE BACKEND              │ │            UNIVERSAL BYTECODE & HARDWARE         │
├────────────────────────┬─────────────────────────┤ ├────────────────────────┬─────────────────────────┤
│ Target Architecture    │ Vector Hardware Engine  │ │ Target Platform        │ Execution Subsystem     │
├────────────────────────┼─────────────────────────┤ ├────────────────────────┼─────────────────────────┤
│ x86-64 (Intel & AMD)   │ AVX2, AVX-512, FMA, AMX │ │ Any OS / Fallback      │ Setun-70 VM (.tbc)      │
│ ARM64 (Apple/Graviton) │ ARM NEON, SVE/SVE2, AMX │ │ Embedded Bare-Metal    │ Microkernel OS          │
│ RISC-V (RV64GC)        │ RVV 1.0 Vector Ext      │ │ FPGA Custom Silicon    │ Verilog-2001 RTL ALU    │
│ WebAssembly (WASI)     │ WASM SIMD128            │ │ Web Browser            │ Wasm JIT + WebAssembly  │
└────────────────────────┴─────────────────────────┘ └────────────────────────┴─────────────────────────┘
```

---

## 5. Lộ Trình Triển Khai Chi Tiết (Roadmap)

### Giai Đoạn 1: Nâng Cấp Ngữ Pháp AST & Type Checker (Tuần 1 - 3)
- [ ] Mở rộng Lexer & Pratt Parser cho `struct`, `class`, `interface`, `enum`, `match`, `f"..."`, `mat![...]`.
- [ ] Xây dựng bộ suy luận kiểu dữ liệu tĩnh tự động (Local Type Inference).
- [ ] Xây dựng bảng biểu thức đa hình không qua vtable ảo đối với `struct` (Monomorphization như C++ templates/Rust).

### Giai Đoạn 2: Xây Dựng LLVM Native Multi-Arch AOT Backend (Tuần 4 - 6)
- [ ] Tích hợp LLVM C++ Target Machines cho **ARM64** (Apple Darwin, Linux ARM), **x86-64** (Intel/AMD), **RISC-V**, **WebAssembly**.
- [ ] Ánh xạ cấu trúc `taf3` $[A, B, S]$ và `branch3` sang LLVM IR với SIMD vectorization (AVX-512, NEON, RVV).
- [ ] Đóng gói pipeline biên dịch chéo:
  ```bash
  setunc compile main.stn --target x86_64-pc-windows-msvc -O3 -o app.exe
  setunc compile main.stn --target aarch64-apple-darwin -O3 -o app_mac
  setunc compile main.stn --target aarch64-unknown-linux-gnu -O3 -o app_graviton
  setunc compile main.stn --target wasm32-wasi -o app.wasm
  ```

### Giai Đoạn 3: Nâng Tầm Trải Nghiệm Lập Trình Pythonic (Tuần 7 - 9)
- [ ] Bổ sung chuỗi nội suy `f"..."`, cú pháp mảng/ma trận trực quan `mat![...]`.
- [ ] Nâng cấp chế độ dòng lệnh tương tác REPL (Auto-completion, Type Inspection).
- [ ] Hoàn thiện trình quản lý gói TPM đa nền tảng (`tpm install`, `tpm publish`, `tpm test`).

### Giai Đoạn 4: Quản Lý Bộ Nhớ Lai & Bất Đồng Bộ 3 Mức Ưu Tiên (Tuần 10 - 12)
- [ ] Phân tích thoát biến (Escape Analysis) tự động phân bổ Stack vs Heap.
- [ ] Tích hợp `async/await` kết nối bộ lập lịch 3-level priority của Setun Microkernel.
- [ ] Phát hành bộ công cụ SDK hoàn chỉnh Setun-70 2.0 (Toolchain, VS Code Extension, Documentation).
