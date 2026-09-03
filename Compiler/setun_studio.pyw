#!/usr/bin/env python3
"""
===============================================================================
SETUN STUDIO v2.0 - Native Desktop IDE (Roman Numeral III Ⅲ Edition)
Dedicated GUI Application for Balanced Ternary & TAFPU Q(sqrt(3)) Development
===============================================================================
"""

import sys
import os
import subprocess
import threading
import tkinter as tk
from tkinter import ttk, filedialog, messagebox, font

# Theme Color Palette (Sleek Cyberpunk Dark Mode)
COLORS = {
    "bg_dark": "#070b14",
    "bg_medium": "#0c1222",
    "bg_light": "#131b31",
    "bg_hover": "#1e294b",
    "border": "#1e294b",
    "fg_white": "#f1f5f9",
    "fg_muted": "#64748b",
    "cyan": "#00f5d4",
    "blue": "#00bbf9",
    "purple": "#9d4edd",
    "pink": "#ff007f",
    "yellow": "#fee440",
    "green": "#10b981",
    "keyword": "#ff007f",
    "type": "#00bbf9",
    "string": "#fee440",
    "comment": "#64748b",
    "number": "#00f5d4",
    "operator": "#9d4edd"
}

KEYWORDS = {
    "fn", "let", "mut", "const", "struct", "class", "interface", "trait",
    "enum", "match", "case", "branch3", "branch", "negative", "zero", "positive",
    "async", "await", "comptime", "return", "if", "else", "while", "for", "in"
}

TYPES = {
    "taf3", "tvec3", "tquat", "tryte", "trit", "int", "float", "double", "string", "bool", "void"
}

STARTER_CODE = """// Setun 2.0 - Native Balanced Ternary & TAFPU Program
fn main() -> int {
    let u1: taf3 = [2, 1, 0];   // 2 + 1*sqrt(3)
    let u2: taf3 = [2, -1, 0];  // 2 - 1*sqrt(3)
    let identity = u1 * u2;     // Exactly [1, 0, 0] = 1.0 (0% error)

    println("Chao mung ban den voi Setun Studio (Logo III)!");
    println("Ket qua phep nhan dai so trong Q(sqrt(3)) la:");
    println(identity);

    branch3(identity) {
        negative => return -1;
        zero     => return 0;
        positive => return 42;
    }
}
"""

class SetunStudioApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Setun Studio v2.0  ─  [ Ⅲ ] Balanced Ternary & TAFPU IDE")
        self.root.geometry("1180x760")
        self.root.minsize(800, 600)
        self.root.configure(bg=COLORS["bg_dark"])

        self.current_file_path = os.path.abspath("hello.stn")
        self.compiler_path = self.find_compiler_path()
        self.current_proc = None
        self.run_mode = tk.StringVar(value="VM (Bytecode Fast)")

        self.setup_fonts()
        self.create_menu()
        self.create_toolbar()
        self.create_main_layout()
        self.create_status_bar()

        # Load starter code
        self.editor.insert("1.0", STARTER_CODE)
        self.highlight_syntax()
        self.update_line_numbers()

    def find_compiler_path(self):
        script_dir = os.path.dirname(os.path.abspath(__file__))
        candidates = [
            os.path.join(script_dir, "setunc.exe"),
            os.path.join(script_dir, "Compiler", "setunc.exe"),
            os.path.join(script_dir, "Code", "setunc.exe"),
            os.path.join(script_dir, "Compiler", "Code", "setunc.exe"),
            "d:\\New PJ\Ternary\\setunc.exe",
            "d:\\New PJ\\Ternary\\Compiler\\setunc.exe",
            "setunc.exe"
        ]
        for p in candidates:
            if os.path.exists(p):
                return p
        return "setunc.exe"

    def setup_fonts(self):
        mono_families = ["JetBrains Mono", "Fira Code", "Consolas", "Courier New"]
        available = font.families()
        chosen_mono = "Consolas"
        for f in mono_families:
            if f in available:
                chosen_mono = f
                break

        self.font_code = font.Font(family=chosen_mono, size=11)
        self.font_console = font.Font(family=chosen_mono, size=10)
        self.font_ui = font.Font(family="Segoe UI", size=10)
        self.font_bold = font.Font(family="Segoe UI", size=10, weight="bold")
        self.font_logo = font.Font(family="Georgia", size=16, weight="bold")

    def create_menu(self):
        menubar = tk.Menu(self.root, bg=COLORS["bg_medium"], fg=COLORS["fg_white"],
                         activebackground=COLORS["cyan"], activeforeground=COLORS["bg_dark"])

        # File Menu
        file_menu = tk.Menu(menubar, tearoff=0, bg=COLORS["bg_medium"], fg=COLORS["fg_white"])
        file_menu.add_command(label="New File (Ctrl+N)", command=self.new_file)
        file_menu.add_command(label="Open File... (Ctrl+O)", command=self.open_file)
        file_menu.add_command(label="Save (Ctrl+S)", command=self.save_file)
        file_menu.add_command(label="Save As...", command=self.save_file_as)
        file_menu.add_separator()
        file_menu.add_command(label="Exit", command=self.root.quit)
        menubar.add_cascade(label="File", menu=file_menu)

        # Edit Menu
        edit_menu = tk.Menu(menubar, tearoff=0, bg=COLORS["bg_medium"], fg=COLORS["fg_white"])
        edit_menu.add_command(label="Format Code (Ctrl+F)", command=self.format_code)
        edit_menu.add_separator()
        edit_menu.add_command(label="Clear Console", command=self.clear_console)
        menubar.add_cascade(label="Edit", menu=edit_menu)

        # Run Menu
        run_menu = tk.Menu(menubar, tearoff=0, bg=COLORS["bg_medium"], fg=COLORS["fg_white"])
        run_menu.add_command(label="Run Script (F5)", command=self.run_script)
        run_menu.add_command(label="Compile to Native AOT .exe (F6)", command=self.compile_native)
        run_menu.add_command(label="Run Comprehensive Tests (F7)", command=self.run_tests)
        menubar.add_cascade(label="Run & Build", menu=run_menu)

        # Help Menu
        help_menu = tk.Menu(menubar, tearoff=0, bg=COLORS["bg_medium"], fg=COLORS["fg_white"])
        help_menu.add_command(label="About Setun Studio III", command=self.show_about)
        menubar.add_cascade(label="Help", menu=help_menu)

        self.root.config(menu=menubar)

        # Global Keybindings
        self.root.bind("<Control-n>", lambda e: self.new_file())
        self.root.bind("<Control-o>", lambda e: self.open_file())
        self.root.bind("<Control-s>", lambda e: self.save_file())
        self.root.bind("<Control-f>", lambda e: self.format_code())
        self.root.bind("<F5>", lambda e: self.run_script())
        self.root.bind("<F6>", lambda e: self.compile_native())
        self.root.bind("<F7>", lambda e: self.run_tests())

    def create_toolbar(self):
        toolbar = tk.Frame(self.root, bg=COLORS["bg_medium"], height=46, bd=0, padx=10, pady=6)
        toolbar.pack(side=tk.TOP, fill=tk.X)

        # Logo Emblem III
        logo_label = tk.Label(toolbar, text="  [ Ⅲ ] SETUN STUDIO  ", font=self.font_logo,
                              bg=COLORS["bg_light"], fg=COLORS["cyan"], padx=8, pady=2,
                              relief="solid", bd=1)
        logo_label.pack(side=tk.LEFT, padx=(0, 15))

        # Buttons
        self.make_btn(toolbar, "+ New", self.new_file, COLORS["bg_light"], COLORS["fg_white"])
        self.make_btn(toolbar, "📂 Open", self.open_file, COLORS["bg_light"], COLORS["fg_white"])
        self.make_btn(toolbar, "💾 Save", self.save_file, COLORS["bg_light"], COLORS["fg_white"])
        self.make_btn(toolbar, "🪄 Format", self.format_code, COLORS["bg_light"], COLORS["fg_white"])

        tk.Label(toolbar, text="|", bg=COLORS["bg_medium"], fg=COLORS["border"]).pack(side=tk.LEFT, padx=6)

        self.make_btn(toolbar, "▶ Run (F5)", self.run_script, COLORS["cyan"], "#070b14", bold=True)
        self.make_btn(toolbar, "■ Stop", self.stop_process, COLORS["pink"], "#ffffff", bold=True)
        self.make_btn(toolbar, "⚡ Native AOT (F6)", self.compile_native, COLORS["purple"], "#ffffff", bold=True)
        self.make_btn(toolbar, "🧪 Tests (F7)", self.run_tests, COLORS["bg_light"], COLORS["yellow"])

        tk.Label(toolbar, text="Mode:", bg=COLORS["bg_medium"], fg=COLORS["fg_muted"], font=self.font_ui).pack(side=tk.LEFT, padx=(8, 4))
        self.mode_combo = ttk.Combobox(toolbar, textvariable=self.run_mode, values=["VM (Bytecode Fast)", "Native AOT (.exe)"],
                                       state="readonly", width=18, font=self.font_ui)
        self.mode_combo.pack(side=tk.LEFT, padx=2)

    def make_btn(self, parent, text, command, bg, fg, bold=False):
        f = self.font_bold if bold else self.font_ui
        btn = tk.Button(parent, text=text, command=command, bg=bg, fg=fg,
                        font=f, bd=0, padx=12, pady=4, cursor="hand2",
                        activebackground=COLORS["blue"], activeforeground="#ffffff")
        btn.pack(side=tk.LEFT, padx=4)
        return btn

    def create_main_layout(self):
        main_paned = tk.PanedWindow(self.root, orient=tk.HORIZONTAL, bg=COLORS["border"], bd=0, sashwidth=4)
        main_paned.pack(fill=tk.BOTH, expand=True)

        # Left Editor & Console Paned Window
        left_paned = tk.PanedWindow(main_paned, orient=tk.VERTICAL, bg=COLORS["border"], bd=0, sashwidth=4)
        main_paned.add(left_paned, minsize=500, stretch="always")

        # Top: Editor Container
        editor_frame = tk.Frame(left_paned, bg=COLORS["bg_dark"])
        left_paned.add(editor_frame, minsize=250, stretch="always")

        self.line_numbers = tk.Text(editor_frame, width=4, padx=4, pady=8, bg=COLORS["bg_medium"],
                                    fg=COLORS["fg_muted"], font=self.font_code, bd=0, state="disabled")
        self.line_numbers.pack(side=tk.LEFT, fill=tk.Y)

        self.editor = tk.Text(editor_frame, wrap="none", padx=10, pady=8, bg=COLORS["bg_dark"],
                              fg=COLORS["fg_white"], font=self.font_code, bd=0,
                              insertbackground=COLORS["cyan"], selectbackground=COLORS["bg_hover"])
        self.editor.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

        v_scroll = tk.Scrollbar(editor_frame, orient=tk.VERTICAL, command=self.sync_scroll_v)
        v_scroll.pack(side=tk.RIGHT, fill=tk.Y)
        self.editor.config(yscrollcommand=lambda f, l: self.on_editor_scroll(f, l, v_scroll))

        # Bottom: Console Container
        console_frame = tk.Frame(left_paned, bg=COLORS["bg_medium"])
        left_paned.add(console_frame, minsize=180, stretch="never")

        console_title_bar = tk.Frame(console_frame, bg=COLORS["bg_light"], height=24)
        console_title_bar.pack(fill=tk.X)
        tk.Label(console_title_bar, text="  TERMINAL & OUTPUT CONSOLE  ", font=self.font_bold,
                 bg=COLORS["bg_light"], fg=COLORS["cyan"]).pack(side=tk.LEFT)

        tk.Button(console_title_bar, text="Clear", command=self.clear_console,
                  bg=COLORS["bg_light"], fg=COLORS["fg_muted"], bd=0, font=self.font_ui).pack(side=tk.RIGHT, padx=6)

        self.console = tk.Text(console_frame, wrap="word", padx=10, pady=8, bg=COLORS["bg_medium"],
                               fg=COLORS["green"], font=self.font_console, bd=0, state="normal")
        self.console.pack(fill=tk.BOTH, expand=True)

        # Right Sidebar: Live TAFPU Monitor Panel
        right_panel = tk.Frame(main_paned, bg=COLORS["bg_medium"], width=280)
        main_paned.add(right_panel, minsize=260, stretch="never")

        tk.Label(right_panel, text="TAFPU REGISTERS & WEISS LATTICE", font=self.font_bold,
                 bg=COLORS["bg_light"], fg=COLORS["yellow"], pady=8).pack(fill=tk.X)

        self.reg_frame = tk.Frame(right_panel, bg=COLORS["bg_medium"], padx=14, pady=10)
        self.reg_frame.pack(fill=tk.BOTH, expand=True)

        self.lbl_reg_a = self.add_monitor_row(self.reg_frame, "Accumulator A (Rational):", "1")
        self.lbl_reg_b = self.add_monitor_row(self.reg_frame, "Accumulator B (Radical √3):", "0")
        self.lbl_reg_s = self.add_monitor_row(self.reg_frame, "Accumulator S (Scale):", "0")
        self.lbl_reg_exact = self.add_monitor_row(self.reg_frame, "Exact Algebraic:", "1 + 0√3", color=COLORS["cyan"])
        self.lbl_reg_approx = self.add_monitor_row(self.reg_frame, "Real Approx Value:", "1.00000000", color=COLORS["yellow"])

        # 3-Way Branch Monitor
        tk.Label(self.reg_frame, text="\n3-WAY BRANCH FLAG:", font=self.font_bold,
                 bg=COLORS["bg_medium"], fg=COLORS["fg_white"]).pack(anchor="w", pady=(8, 4))

        self.flag_frame = tk.Frame(self.reg_frame, bg=COLORS["bg_medium"])
        self.flag_frame.pack(fill=tk.X, pady=4)

        self.pill_neg = tk.Label(self.flag_frame, text="[-] NEG", bg=COLORS["bg_light"], fg=COLORS["fg_muted"], font=self.font_bold, width=7, pady=4)
        self.pill_neg.pack(side=tk.LEFT, padx=2)
        self.pill_zero = tk.Label(self.flag_frame, text="[0] ZERO", bg=COLORS["bg_light"], fg=COLORS["fg_muted"], font=self.font_bold, width=7, pady=4)
        self.pill_zero.pack(side=tk.LEFT, padx=2)
        self.pill_pos = tk.Label(self.flag_frame, text="[+] POS", bg=COLORS["cyan"], fg="#070b14", font=self.font_bold, width=7, pady=4)
        self.pill_pos.pack(side=tk.LEFT, padx=2)

        # Events
        self.editor.bind("<KeyRelease>", self.on_key_release)
        self.editor.bind("<Return>", self.on_return_key)
        self.editor.bind("<Tab>", self.on_tab_key)

    def add_monitor_row(self, parent, title, val, color=COLORS["fg_white"]):
        f = tk.Frame(parent, bg=COLORS["bg_medium"])
        f.pack(fill=tk.X, pady=3)
        tk.Label(f, text=title, bg=COLORS["bg_medium"], fg=COLORS["fg_muted"], font=self.font_ui).pack(side=tk.LEFT)
        lbl = tk.Label(f, text=val, bg=COLORS["bg_medium"], fg=color, font=self.font_bold)
        lbl.pack(side=tk.RIGHT)
        return lbl

    def create_status_bar(self):
        status_bar = tk.Frame(self.root, bg=COLORS["bg_dark"], height=24, bd=0, padx=10)
        status_bar.pack(side=tk.BOTTOM, fill=tk.X)

        self.lbl_status = tk.Label(status_bar, text="● Setun Engine: READY  |  Target: x86-64 / ARM64 Multi-Arch",
                                   bg=COLORS["bg_dark"], fg=COLORS["cyan"], font=self.font_ui)
        self.lbl_status.pack(side=tk.LEFT)

        self.lbl_pos = tk.Label(status_bar, text="Ln 1, Col 1  |  UTF-8  |  Setun 2.0",
                                bg=COLORS["bg_dark"], fg=COLORS["fg_muted"], font=self.font_ui)
        self.lbl_pos.pack(side=tk.RIGHT)

    # =========================================================================
    # Editor Events & Syntax Highlighting
    # =========================================================================

    def sync_scroll_v(self, *args):
        self.editor.yview(*args)
        self.line_numbers.yview(*args)

    def on_editor_scroll(self, first, last, scrollbar):
        scrollbar.set(first, last)
        self.line_numbers.yview_moveto(first)

    def on_key_release(self, event=None):
        self.update_line_numbers()
        self.update_cursor_pos()
        self.highlight_syntax()

    def on_tab_key(self, event):
        self.editor.insert(tk.INSERT, "    ")
        return "break"

    def on_return_key(self, event):
        curr_line = self.editor.get("insert linestart", "insert")
        indent = len(curr_line) - len(curr_line.lstrip(" "))
        extra = 4 if curr_line.strip().endswith(("{", "(", "=>", "->")) else 0
        self.editor.insert(tk.INSERT, "\n" + " " * (indent + extra))
        self.update_line_numbers()
        return "break"

    def update_cursor_pos(self):
        cursor = self.editor.index(tk.INSERT)
        line, col = cursor.split(".")
        self.lbl_pos.config(text=f"Ln {line}, Col {int(col)+1}  |  UTF-8  |  Setun 2.0")

    def update_line_numbers(self):
        total_lines = int(self.editor.index("end-1c").split(".")[0])
        line_str = "\n".join(str(i) for i in range(1, total_lines + 1))
        self.line_numbers.config(state="normal")
        self.line_numbers.delete("1.0", tk.END)
        self.line_numbers.insert("1.0", line_str)
        self.line_numbers.config(state="disabled")

    def highlight_syntax(self):
        self.editor.tag_configure("kw", foreground=COLORS["keyword"], font=self.font_bold)
        self.editor.tag_configure("type", foreground=COLORS["type"], font=self.font_bold)
        self.editor.tag_configure("str", foreground=COLORS["string"])
        self.editor.tag_configure("comment", foreground=COLORS["comment"])
        self.editor.tag_configure("op", foreground=COLORS["operator"], font=self.font_bold)

        for tag in ["kw", "type", "str", "comment", "op"]:
            self.editor.tag_remove(tag, "1.0", tk.END)

        content = self.editor.get("1.0", tk.END)
        lines = content.split("\n")

        for line_idx, line in enumerate(lines, start=1):
            if "//" in line:
                c_idx = line.find("//")
                self.editor.tag_add("comment", f"{line_idx}.{c_idx}", f"{line_idx}.end")
                line = line[:c_idx]

            in_str = False
            str_start = 0
            for i, ch in enumerate(line):
                if ch == '"':
                    if not in_str:
                        in_str = True
                        str_start = i
                    else:
                        in_str = False
                        self.editor.tag_add("str", f"{line_idx}.{str_start}", f"{line_idx}.{i+1}")

            import re
            for m in re.finditer(r'\b[a-zA-Z_0-9]+\b', line):
                word = m.group(0)
                start_col = m.start()
                end_col = m.end()
                if word in KEYWORDS:
                    self.editor.tag_add("kw", f"{line_idx}.{start_col}", f"{line_idx}.{end_col}")
                elif word in TYPES:
                    self.editor.tag_add("type", f"{line_idx}.{start_col}", f"{line_idx}.{end_col}")

            for op in ["=>", "->", "@"]:
                pos = 0
                while True:
                    idx = line.find(op, pos)
                    if idx == -1:
                        break
                    self.editor.tag_add("op", f"{line_idx}.{idx}", f"{line_idx}.{idx+len(op)}")
                    pos = idx + len(op)

    # =========================================================================
    # File Operations
    # =========================================================================

    def new_file(self):
        self.editor.delete("1.0", tk.END)
        self.editor.insert("1.0", "// New Setun 2.0 file\nfn main() -> int {\n    println(\"Hello Setun-70!\");\n    return 0;\n}\n")
        self.current_file_path = os.path.abspath("untitled.stn")
        self.root.title("Setun Studio v2.0  ─  [ Ⅲ ] untitled.stn")
        self.on_key_release()

    def open_file(self):
        path = filedialog.askopenfilename(filetypes=[("Setun Source Files", "*.stn *.setun"), ("All Files", "*.*")])
        if path:
            with open(path, "r", encoding="utf-8") as f:
                content = f.read()
            self.editor.delete("1.0", tk.END)
            self.editor.insert("1.0", content)
            self.current_file_path = os.path.abspath(path)
            self.root.title(f"Setun Studio v2.0  ─  [ Ⅲ ] {os.path.basename(path)}")
            self.on_key_release()
            self.log_console(f"Opened file: {path}")

    def save_file(self):
        if not self.current_file_path:
            return self.save_file_as()
        with open(self.current_file_path, "w", encoding="utf-8") as f:
            f.write(self.editor.get("1.0", "end-1c"))
        self.log_console(f"Saved: {os.path.basename(self.current_file_path)}")
        return True

    def save_file_as(self):
        path = filedialog.asksaveasfilename(defaultextension=".stn", filetypes=[("Setun Source Files", "*.stn"), ("All Files", "*.*")])
        if path:
            self.current_file_path = os.path.abspath(path)
            self.root.title(f"Setun Studio v2.0  ─  [ Ⅲ ] {os.path.basename(path)}")
            return self.save_file()
        return False

    def format_code(self):
        code = self.editor.get("1.0", "end-1c")
        lines = code.split("\n")
        indent = 0
        formatted = []
        for l in lines:
            t = l.strip()
            if t.startswith(("}", ")")):
                indent = max(0, indent - 1)
            formatted.append("    " * indent + t)
            if t.endswith(("{", "(")):
                indent += 1
        new_code = "\n".join(formatted)
        self.editor.delete("1.0", tk.END)
        self.editor.insert("1.0", new_code)
        self.on_key_release()
        self.log_console("Formatted source code with standard 4-space indentation.")

    # =========================================================================
    # Run, Compile & Console
    # =========================================================================

    def log_console(self, text, is_error=False):
        self.console.insert(tk.END, text + "\n")
        self.console.see(tk.END)

    def clear_console(self):
        self.console.delete("1.0", tk.END)

    def stop_process(self):
        if self.current_proc and self.current_proc.poll() is None:
            try:
                self.current_proc.kill()
                self.log_console("\n[■ STOPPED] Process was terminated by user.", is_error=True)
            except Exception as e:
                self.log_console(f"[Error stopping process]: {e}", is_error=True)
            self.current_proc = None
        else:
            self.log_console("[Info] No active process running.")

    def run_script(self):
        if not self.save_file():
            return
        self.clear_console()

        mode = self.run_mode.get()
        out_exe = os.path.splitext(self.current_file_path)[0] + ".exe"

        def target():
            try:
                if "Native" in mode:
                    self.log_console(f"⚡ [Native AOT] Compiling {os.path.basename(self.current_file_path)}...")
                    compile_proc = subprocess.run([self.compiler_path, "compile", self.current_file_path, "--native", "-o", out_exe, "-O3"],
                                                  capture_output=True, text=True, cwd=os.path.dirname(self.current_file_path) or ".")
                    if compile_proc.returncode != 0:
                        if compile_proc.stdout: self.log_console(compile_proc.stdout.strip())
                        if compile_proc.stderr: self.log_console(compile_proc.stderr.strip(), is_error=True)
                        return
                    self.log_console(f"▶ [Running Native Binary] .\\{os.path.basename(out_exe)}...")
                    cmd = [out_exe]
                else:
                    self.log_console(f"▶ [Setun VM] Running {os.path.basename(self.current_file_path)} in Bytecode VM...")
                    cmd = [self.compiler_path, "run", self.current_file_path]

                self.current_proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True,
                                                     cwd=os.path.dirname(self.current_file_path) or ".")
                stdout, stderr = self.current_proc.communicate()

                if stdout:
                    self.log_console(stdout.strip())
                if stderr:
                    self.log_console(stderr.strip(), is_error=True)

                self.log_console(f"\n[Program finished with exit code {self.current_proc.returncode}]")
                self.update_monitor_sample(1, 0, 0, 1)
                self.current_proc = None
            except Exception as e:
                self.log_console(f"[Execution Error]: {e}", is_error=True)
                self.current_proc = None

        threading.Thread(target=target, daemon=True).start()

    def compile_native(self):
        if not self.save_file():
            return
        out_exe = os.path.splitext(self.current_file_path)[0] + ".exe"
        self.clear_console()
        self.log_console(f"⚡ [Native AOT] Compiling {os.path.basename(self.current_file_path)} -> {os.path.basename(out_exe)}...")

        def target():
            try:
                proc = subprocess.run([self.compiler_path, "compile", self.current_file_path, "--native", "-o", out_exe, "-O3"],
                                      capture_output=True, text=True, cwd=os.path.dirname(self.current_file_path) or ".")
                if proc.stdout:
                    self.log_console(proc.stdout.strip())
                if proc.stderr:
                    self.log_console(proc.stderr.strip())
                if proc.returncode == 0:
                    self.log_console(f"\n[OK] Native Binary built successfully: .\\{os.path.basename(out_exe)}")
            except Exception as e:
                self.log_console(f"[Compilation Error]: {e}")

        threading.Thread(target=target, daemon=True).start()

    def run_tests(self):
        self.clear_console()
        self.log_console("🧪 [Test Suite] Running all 13 Setun & TAFPU modules...")
        def target():
            try:
                proc = subprocess.run([self.compiler_path, "test"],
                                      capture_output=True, text=True, cwd=os.path.dirname(self.compiler_path) or ".")
                if proc.stdout:
                    self.log_console(proc.stdout.strip())
            except Exception as e:
                self.log_console(f"[Test Error]: {e}")
        threading.Thread(target=target, daemon=True).start()

    def update_monitor_sample(self, a, b, s, flag):
        self.lbl_reg_a.config(text=str(a))
        self.lbl_reg_b.config(text=str(b))
        self.lbl_reg_s.config(text=str(s))
        self.lbl_reg_exact.config(text=f"{a} + {b}√3")
        approx = (a + b * (3 ** 0.5)) * ((3 ** 0.5) ** s)
        self.lbl_reg_approx.config(text=f"{approx:.8f}")

        self.pill_neg.config(bg=COLORS["pink"] if flag == -1 else COLORS["bg_light"], fg="#070b14" if flag == -1 else COLORS["fg_muted"])
        self.pill_zero.config(bg=COLORS["cyan"] if flag == 0 else COLORS["bg_light"], fg="#070b14" if flag == 0 else COLORS["fg_muted"])
        self.pill_pos.config(bg=COLORS["blue"] if flag == 1 else COLORS["bg_light"], fg="#070b14" if flag == 1 else COLORS["fg_muted"])

    def show_about(self):
        messagebox.showinfo("About Setun Studio",
                            "Setun Studio v2.0\n"
                            "Emblem: Roman Numeral III (Ⅲ)\n\n"
                            "Dedicated Native Desktop IDE for Setun-70 Balanced Ternary\n"
                            "and TAFPU Q(√3) Algebraic Computing.\n"
                            "Developed for Zero-Drift Physics and High-Throughput BitNet AI.")


if __name__ == "__main__":
    tk_root = tk.Tk()
    app = SetunStudioApp(tk_root)
    tk_root.mainloop()
