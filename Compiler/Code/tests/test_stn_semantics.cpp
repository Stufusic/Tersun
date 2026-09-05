// Tersun 1.0.3 core-semantics suite. Runs real .stn script files through the
// full production pipeline (lex -> parse -> resolve -> typecheck ->
// monomorphize -> emit -> VM) plus negative compile tests for the checks
// introduced with the 1.0.3 core fixes.
#include "compiler/arena.hpp"
#include "compiler/lexer.hpp"
#include "compiler/parser.hpp"
#include "compiler/module_resolver.hpp"
#include "compiler/type_checker.hpp"
#include "compiler/monomorphizer.hpp"
#include "compiler/emitter.hpp"
#include "vm/vm.hpp"
#include "tafpu/exception.hpp"

#include <cassert>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

namespace setun {

namespace {

std::string read_file_str(const std::string& path) {
    std::ifstream f(path, std::ios::binary);
    assert(f.is_open() && "cannot open .stn test script");
    std::stringstream ss;
    ss << f.rdbuf();
    return ss.str();
}

// Test scripts live in Code/tests/stn; be tolerant of the invocation CWD.
std::string find_script(const std::string& name) {
    const char* prefixes[] = {"tests/stn/", "Code/tests/stn/", "../Code/tests/stn/"};
    for (const char* p : prefixes) {
        std::string candidate = std::string(p) + name;
        std::ifstream f(candidate);
        if (f.is_open()) {
            return candidate;
        }
    }
    assert(false && ".stn test script not found (run setunc_test from Code/ or the repo root)");
    return "";
}

VM run_stn_file(const std::string& name) {
    std::string path = find_script(name);
    std::string source = read_file_str(path);

    ArenaAllocator arena;
    Lexer lexer(source, path);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program program = parser.parse_program();

    ModuleResolver resolver(arena);
    bool resolved = resolver.resolve_program(program, path);
    assert(resolved && "module resolution failed for .stn test script");

    TypeChecker checker;
    bool ok = checker.check_program(program);
    assert(ok && "type checking failed for .stn test script");

    Monomorphizer mono;
    mono.process_program(program);

    BytecodeEmitter emitter;
    Chunk chunk = emitter.compile(program);

    VM vm;
    vm.run(chunk);
    return vm;
}

bool typecheck_fails_with(const std::string& src, const std::string& needle) {
    ArenaAllocator arena;
    Lexer lexer(src);
    auto tokens = lexer.tokenize();
    Parser parser(tokens, arena);
    Program program = parser.parse_program();
    TypeChecker checker;
    checker.check_program(program);
    if (!checker.has_errors()) {
        return false;
    }
    for (const auto& e : checker.errors()) {
        if (e.message.find(needle) != std::string::npos) {
            return true;
        }
    }
    return false;
}

void test_stn_ctor_autoinit() {
    VM vm = run_stn_file("ctor_autoinit.stn");
    assert(vm.last_output().find("CTOR_OK") != std::string::npos);
}

void test_stn_strings_arrays() {
    VM vm = run_stn_file("strings_arrays.stn");
    assert(vm.last_output().find("STRARR_OK") != std::string::npos);
}

void test_stn_logic_ops() {
    VM vm = run_stn_file("logic_ops.stn");
    assert(vm.last_output().find("LOGIC_OK") != std::string::npos);
}

void test_stn_modules_ok() {
    VM vm = run_stn_file("modules_ok.stn");
    // The helper module defines its own main(); it must be namespaced away
    // so the captured output is exactly the importing program's output.
    assert(vm.last_output() == "MOD_OK\n");
}

void test_stn_fs_roundtrip() {
    VM vm = run_stn_file("fs_roundtrip.stn");
    assert(vm.last_output().find("FS_OK") != std::string::npos);
}

void test_stn_negative_compile() {
    // 1. Duplicate function definition (same file or merged modules)
    assert(typecheck_fails_with(
        "fn dup() -> int { return 1; } fn dup() -> int { return 2; }",
        "Redefinition of function"));

    // 2. Method typo on a class with known methods
    assert(typecheck_fails_with(
        "class W { pub x: int; def get_x(self) -> int { return self.x; } } "
        "fn main() { let w = W(); let r = w.get_xx(); }",
        "no method"));

    // 3. Unknown built-in string method
    assert(typecheck_fails_with(
        "fn main() { let s = \"hi\"; let t = s.trimx(); }",
        "no method"));

    // 4. Constructor arity mismatch -> emitter error with location
    {
        std::string src =
            "class P { pub x: int; pub y: int; "
            "def init(self, a: int, b: int) { self.x = a; self.y = b; } } "
            "fn main() { let p = P(1); }";
        ArenaAllocator arena;
        Lexer lexer(src);
        auto tokens = lexer.tokenize();
        Parser parser(tokens, arena);
        Program program = parser.parse_program();
        TypeChecker checker;
        assert(checker.check_program(program));
        Monomorphizer mono;
        mono.process_program(program);
        BytecodeEmitter emitter;
        bool threw = false;
        try {
            emitter.compile(program);
        } catch (const CompilerException&) {
            threw = true;
        }
        assert(threw && "constructor arity mismatch must raise CompilerException");
    }
}

} // namespace

void test_stn_semantics_suite() {
    test_stn_ctor_autoinit();
    test_stn_strings_arrays();
    test_stn_logic_ops();
    test_stn_modules_ok();
    test_stn_fs_roundtrip();
    test_stn_negative_compile();
}

} // namespace setun
