# Đặc Tả Ngôn Ngữ Lập Trình Tam Phân Cân Bằng Setun-70 & TAFPU (Official Language Specification v1.0)

## 1. Cú Pháp Ngữ Pháp Chuẩn EBNF (Grammar Specification)

```ebnf
Program        ::= { Statement } ;

Statement      ::= VarDeclStmt
                 | AssignStmt
                 | ExprStmt
                 | BlockStmt
                 | IfStmt
                 | Branch3Stmt
                 | WhileStmt
                 | ReturnStmt
                 | FnDeclStmt ;

VarDeclStmt    ::= "let" IDENTIFIER [ ":" Type ] "=" Expression ";" ;
AssignStmt     ::= IDENTIFIER "=" Expression ";" ;
ExprStmt       ::= Expression ";" ;
BlockStmt      ::= "{" { Statement } "}" ;
IfStmt         ::= "if" "(" Expression ")" Statement [ "else" Statement ] ;

Branch3Stmt    ::= "branch" "(" Expression ")" "{"
                     [ "case" ] ( "-1" | "T" ) ( ":" | "->" ) Statement
                     [ "case" ] ( "0" )        ( ":" | "->" ) Statement
                     [ "case" ] ( "+1" | "1" ) ( ":" | "->" ) Statement
                   "}" ;

WhileStmt      ::= "while" "(" Expression ")" Statement ;
ReturnStmt     ::= "return" [ Expression ] ";" ;
FnDeclStmt     ::= "fn" IDENTIFIER "(" [ ParamList ] ")" [ "->" Type ] BlockStmt ;
ParamList      ::= Param { "," Param } ;
Param          ::= IDENTIFIER ":" Type ;

Type           ::= "trit" | "tryte" | "taf3" | "int" | "float" | "bool" | "string" ;

Expression     ::= Assignment ;
Assignment     ::= TernaryCmp [ "=" Expression ] ;
TernaryCmp     ::= Equality [ "<=>" Equality ] ;
Equality       ::= Comparison { ( "==" | "!=" ) Comparison } ;
Comparison     ::= Addition { ( "<" | "<=" | ">" | ">=" ) Addition } ;
Addition       ::= Multiplication { ( "+" | "-" ) Multiplication } ;
Multiplication ::= KleeneLogic { ( "*" | "/" ) KleeneLogic } ;
KleeneLogic    ::= Unary { ( "min" | "max" ) Unary } ;
Unary          ::= ( "-" | "~" | "not" ) Unary | Primary ;
Primary        ::= INT_LITERAL | FLOAT_LITERAL | STRING_LITERAL | BOOL_LITERAL
                 | TAFPU_LITERAL | TRYTE_LITERAL | IDENTIFIER
                 | "(" Expression ")" | CallExpr ;
TAFPU_LITERAL  ::= "[" Expression "," Expression "," Expression "]" ;
CallExpr       ::= IDENTIFIER "(" [ Expression { "," Expression } ] ")" ;
```

---

## 2. Hệ Thống Kiểu Dữ Liệu Tĩnh (Static Type System)

| Kiểu dữ liệu | Kích thước | Miền giá trị / Mô tả |
| :--- | :--- | :--- |
| `trit` | 2 bit | $\{-1, 0, 1\}$ hay $\{\text{T}, 0, 1\}$. |
| `tryte` | 16 bit | Mảng 6 Trit cân bằng: $[-364, 364]$. |
| `taf3` | 24 bytes | Số thực đại số $\mathbb{Q}(\sqrt{3})$: $[A, B, S]$. |
| `int` | 64 bit | Số nguyên signed 64-bit. |
| `float` | 64 bit | Số thực dấu phẩy động chuẩn IEEE 754. |
| `bool` | 1 byte | Logic nhị phân chuẩn `true` / `false`. |
| `string` | Con trỏ | Chuỗi ký tự ASCII / Tryte Table. |

---

## 3. Tập Lệnh Bytecode Máy Ảo Setun-70 (Bytecode ISA)

| Opcode | Hex | Toán hạng | Mô tả chức năng |
| :--- | :--- | :--- | :--- |
| `OP_HALT` | `0x00` | None | Dừng thực thi máy ảo. |
| `OP_PUSH_INT` | `0x01` | `int64_t` | Đẩy số nguyên 64-bit lên Stack. |
| `OP_PUSH_TRYTE` | `0x02` | `int16_t` | Đẩy Tryte 6-trit lên Stack. |
| `OP_PUSH_TAFPU` | `0x03` | `int64, int64, int32` | Đẩy số đại số $[A, B, S]$ lên Stack. |
| `OP_TAFPU_CONSTRUCT` | `0x0A` | None | Ghép 3 giá trị đỉnh stack thành `[A, B, S]`. |
| `OP_ADD`, `OP_SUB`, `OP_MUL`, `OP_DIV` | `0x10-0x13`| None | Phép toán số học đại số 0% sai số. |
| `OP_KLEENE_MIN`, `OP_KLEENE_MAX` | `0x14-0x15`| None | Cổng logic Kleene tam phân. |
| `OP_CMP3` | `0x27` | None | So sánh 3 hướng: trả về $-1, 0, +1$. |
| `OP_BRANCH_3` | `0x32` | `int16, int16, int16` | Rẽ nhánh 3 hướng trong 1 chu kỳ máy. |
| `OP_CALL`, `OP_RET` | `0x33-0x34`| `uint16, uint8` | Gọi hàm và trở về qua CallFrame. |
