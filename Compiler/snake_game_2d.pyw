"""
================================================================================
SETUN 2.0 - 2D BALANCED TERNARY GRAPHICAL SNAKE GAME
Chương trình đồ họa 2D trực quan hóa thuật toán tam phân cân bằng & TAFPU
================================================================================
"""

import tkinter as tk
from tkinter import font
import random
import math

# Cyberpunk & Setun-70 Color Palette
COLORS = {
    "bg_dark": "#070b14",
    "bg_board": "#0a1122",
    "grid_line": "#101d36",
    "snake_head": "#00f0ff",
    "snake_body": "#0099cc",
    "food": "#ff007f",
    "food_glow": "#700038",
    "text_white": "#ffffff",
    "text_cyan": "#00f0ff",
    "text_yellow": "#ffe600",
    "text_purple": "#b026ff",
    "text_muted": "#5c6b84",
    "panel_bg": "#0e182e",
    "panel_border": "#1b2d54",
}

CELL_SIZE = 24
GRID_WIDTH = 25
GRID_HEIGHT = 20
BOARD_WIDTH = CELL_SIZE * GRID_WIDTH
BOARD_HEIGHT = CELL_SIZE * GRID_HEIGHT

class SetunSnake2D:
    def __init__(self, root):
        self.root = root
        self.root.title("Setun 2.0 ─ [ Ⅲ ] 2D Balanced Ternary Snake Game")
        self.root.resizable(False, False)
        self.root.configure(bg=COLORS["bg_dark"])

        # Game State
        self.running = True
        self.auto_pilot = True  # Default: Setun AI controls the snake using branch3
        self.speed_ms = 110
        self.score = 0
        self.step_count = 0

        # Snake: list of (x, y) coordinates
        self.snake = [(10, 10), (9, 10), (8, 10)]
        # Direction: Trit {-1, 0, +1}
        self.dir_x = 1
        self.dir_y = 0
        self.next_dir_x = 1
        self.next_dir_y = 0

        # Food: (x, y)
        self.food = (18, 10)

        # Branch3 Decision state for HUD
        self.last_branch_x = "+1 (POSITIVE)"
        self.last_branch_y = "0 (ZERO)"

        self.setup_ui()
        self.bind_events()
        self.game_loop()

    def setup_ui(self):
        main_frame = tk.Frame(self.root, bg=COLORS["bg_dark"], padx=16, pady=16)
        main_frame.pack()

        # Top Header Banner
        header = tk.Frame(main_frame, bg=COLORS["panel_bg"], bd=1, relief="solid",
                          highlightbackground=COLORS["panel_border"], highlightthickness=1)
        header.pack(fill=tk.X, pady=(0, 12))

        title = tk.Label(header, text="  [ Ⅲ ] SETUN 2.0 TERNARY 2D ENGINE  ",
                         font=("Segoe UI", 13, "bold"), bg=COLORS["panel_bg"], fg=COLORS["text_cyan"], pady=6)
        title.pack(side=tk.LEFT, padx=10)

        subtitle = tk.Label(header, text="Exact Coordinates in Q(√3) | Branch3 Decision Loop",
                            font=("Segoe UI", 10), bg=COLORS["panel_bg"], fg=COLORS["text_muted"])
        subtitle.pack(side=tk.LEFT, padx=10)

        # Content: Board + Right HUD Panel
        content_frame = tk.Frame(main_frame, bg=COLORS["bg_dark"])
        content_frame.pack()

        # Canvas for 2D Game Board
        self.canvas = tk.Canvas(content_frame, width=BOARD_WIDTH, height=BOARD_HEIGHT,
                               bg=COLORS["bg_board"], bd=1, relief="solid",
                               highlightbackground=COLORS["panel_border"], highlightthickness=1)
        self.canvas.pack(side=tk.LEFT, padx=(0, 16))

        # Right HUD Panel
        hud = tk.Frame(content_frame, bg=COLORS["panel_bg"], width=280, bd=1, relief="solid",
                       highlightbackground=COLORS["panel_border"], highlightthickness=1, padx=14, pady=12)
        hud.pack(side=tk.RIGHT, fill=tk.Y)
        hud.pack_propagate(False)

        # Section: Mode Selection
        tk.Label(hud, text="CONTROL MODE", font=("Segoe UI", 10, "bold"),
                 bg=COLORS["panel_bg"], fg=COLORS["text_yellow"]).pack(anchor="w", pady=(0, 4))

        mode_frame = tk.Frame(hud, bg=COLORS["panel_bg"])
        mode_frame.pack(fill=tk.X, pady=(0, 12))

        self.btn_auto = tk.Button(mode_frame, text="🤖 Setun AI (branch3)", command=self.set_auto_mode,
                                  bg=COLORS["snake_head"], fg=COLORS["bg_dark"], font=("Segoe UI", 9, "bold"),
                                  bd=0, padx=8, pady=4, cursor="hand2")
        self.btn_auto.pack(side=tk.LEFT, fill=tk.X, expand=True, padx=(0, 4))

        self.btn_manual = tk.Button(mode_frame, text="🎮 Manual Play", command=self.set_manual_mode,
                                    bg=COLORS["grid_line"], fg=COLORS["text_white"], font=("Segoe UI", 9),
                                    bd=0, padx=8, pady=4, cursor="hand2")
        self.btn_manual.pack(side=tk.RIGHT, fill=tk.X, expand=True)

        # Section: Score & Steps
        tk.Label(hud, text="GAME STATISTICS", font=("Segoe UI", 10, "bold"),
                 bg=COLORS["panel_bg"], fg=COLORS["text_yellow"]).pack(anchor="w", pady=(8, 4))

        self.lbl_score = self.make_hud_row(hud, "Score:", "0", COLORS["text_cyan"])
        self.lbl_steps = self.make_hud_row(hud, "Step Count:", "0", COLORS["text_white"])
        self.lbl_length = self.make_hud_row(hud, "Snake Length:", "3", COLORS["text_white"])

        # Separator
        tk.Frame(hud, bg=COLORS["panel_border"], height=1).pack(fill=tk.X, pady=12)

        # Section: TAFPU Registers in Q(sqrt(3))
        tk.Label(hud, text="TAFPU REGISTERS Q(√3)", font=("Segoe UI", 10, "bold"),
                 bg=COLORS["panel_bg"], fg=COLORS["text_purple"]).pack(anchor="w", pady=(0, 4))

        self.lbl_head_pos = self.make_hud_row(hud, "Head (X, Y):", "(10, 10)", COLORS["text_cyan"])
        self.lbl_food_pos = self.make_hud_row(hud, "Food (X, Y):", "(18, 10)", COLORS["text_pink"] if "text_pink" in COLORS else COLORS["text_yellow"])
        self.lbl_exact_alg = self.make_hud_row(hud, "Exact Norm:", "10 + 10√3", COLORS["text_white"])
        self.lbl_float_approx = self.make_hud_row(hud, "Float Approx:", "≈ 27.3205", COLORS["text_muted"])

        # Separator
        tk.Frame(hud, bg=COLORS["panel_border"], height=1).pack(fill=tk.X, pady=12)

        # Section: Balanced Ternary Trits & Branch3 HUD
        tk.Label(hud, text="BALANCED TERNARY TRITS", font=("Segoe UI", 10, "bold"),
                 bg=COLORS["panel_bg"], fg=COLORS["text_cyan"]).pack(anchor="w", pady=(0, 4))

        self.lbl_trit_x = self.make_hud_row(hud, "dir_x Trit:", "+1 (Right)", COLORS["text_cyan"])
        self.lbl_trit_y = self.make_hud_row(hud, "dir_y Trit:", " 0 (None)", COLORS["text_white"])
        self.lbl_branch_x = self.make_hud_row(hud, "branch3(Δx):", "+1 (POSITIVE)", COLORS["text_yellow"])
        self.lbl_branch_y = self.make_hud_row(hud, "branch3(Δy):", " 0 (ZERO)", COLORS["text_white"])

        # Bottom Buttons
        btn_frame = tk.Frame(hud, bg=COLORS["panel_bg"])
        btn_frame.pack(side=tk.BOTTOM, fill=tk.X, pady=(10, 0))

        btn_restart = tk.Button(btn_frame, text="↺ Restart Game", command=self.restart_game,
                                bg="#212f4d", fg=COLORS["text_white"], font=("Segoe UI", 9),
                                bd=0, pady=5, cursor="hand2")
        btn_restart.pack(fill=tk.X)

    def make_hud_row(self, parent, label_text, val_text, val_color):
        row = tk.Frame(parent, bg=COLORS["panel_bg"])
        row.pack(fill=tk.X, pady=2)
        lbl_lbl = tk.Label(row, text=label_text, font=("Segoe UI", 9),
                           bg=COLORS["panel_bg"], fg=COLORS["text_muted"])
        lbl_lbl.pack(side=tk.LEFT)
        lbl_val = tk.Label(row, text=val_text, font=("Segoe UI", 9, "bold"),
                           bg=COLORS["panel_bg"], fg=val_color)
        lbl_val.pack(side=tk.RIGHT)
        return lbl_val

    def bind_events(self):
        self.root.bind("<Up>", lambda e: self.on_key(0, -1))
        self.root.bind("<Down>", lambda e: self.on_key(0, 1))
        self.root.bind("<Left>", lambda e: self.on_key(-1, 0))
        self.root.bind("<Right>", lambda e: self.on_key(1, 0))

        self.root.bind("<w>", lambda e: self.on_key(0, -1))
        self.root.bind("<s>", lambda e: self.on_key(0, 1))
        self.root.bind("<a>", lambda e: self.on_key(-1, 0))
        self.root.bind("<d>", lambda e: self.on_key(1, 0))
        self.root.bind("<space>", lambda e: self.toggle_auto_pilot())

    def on_key(self, dx, dy):
        if self.auto_pilot:
            # Switch to manual mode on user key press
            self.set_manual_mode()
        # Prevent 180-degree turn into self
        if (dx, dy) != (-self.dir_x, -self.dir_y):
            self.next_dir_x = dx
            self.next_dir_y = dy

    def set_auto_mode(self):
        self.auto_pilot = True
        self.btn_auto.config(bg=COLORS["snake_head"], fg=COLORS["bg_dark"], font=("Segoe UI", 9, "bold"))
        self.btn_manual.config(bg=COLORS["grid_line"], fg=COLORS["text_white"], font=("Segoe UI", 9))

    def set_manual_mode(self):
        self.auto_pilot = False
        self.btn_manual.config(bg=COLORS["text_yellow"], fg=COLORS["bg_dark"], font=("Segoe UI", 9, "bold"))
        self.btn_auto.config(bg=COLORS["grid_line"], fg=COLORS["text_white"], font=("Segoe UI", 9))

    def toggle_auto_pilot(self):
        if self.auto_pilot:
            self.set_manual_mode()
        else:
            self.set_auto_mode()

    def restart_game(self):
        self.snake = [(10, 10), (9, 10), (8, 10)]
        self.dir_x = 1
        self.dir_y = 0
        self.next_dir_x = 1
        self.next_dir_y = 0
        self.score = 0
        self.step_count = 0
        self.running = True
        self.spawn_food()

    def spawn_food(self):
        while True:
            fx = random.randint(1, GRID_WIDTH - 2)
            fy = random.randint(1, GRID_HEIGHT - 2)
            if (fx, fy) not in self.snake:
                self.food = (fx, fy)
                break

    def setun_ai_step(self):
        """
        Thuật toán rẽ nhánh tam phân bản địa (Setun 2.0 Balanced Ternary Brain):
        branch3(delta_x) và branch3(delta_y) để định hướng di chuyển.
        """
        head_x, head_y = self.snake[0]
        food_x, food_y = self.food

        dist_x = food_x - head_x
        dist_y = food_y - head_y

        # Update branch3 HUD
        if dist_x < 0:
            self.last_branch_x = "-1 (NEGATIVE: Left)"
        elif dist_x == 0:
            self.last_branch_x = " 0 (ZERO: Aligned)"
        else:
            self.last_branch_x = "+1 (POSITIVE: Right)"

        if dist_y < 0:
            self.last_branch_y = "-1 (NEGATIVE: Up)"
        elif dist_y == 0:
            self.last_branch_y = " 0 (ZERO: Aligned)"
        else:
            self.last_branch_y = "+1 (POSITIVE: Down)"

        # Safe candidate directions in order of preference
        preferred_moves = []

        # Choose primary axis by distance
        if abs(dist_x) >= abs(dist_y):
            # Prioritize X
            trit_x = -1 if dist_x < 0 else (1 if dist_x > 0 else 0)
            trit_y = -1 if dist_y < 0 else (1 if dist_y > 0 else 0)
            if trit_x != 0: preferred_moves.append((trit_x, 0))
            if trit_y != 0: preferred_moves.append((0, trit_y))
        else:
            # Prioritize Y
            trit_x = -1 if dist_x < 0 else (1 if dist_x > 0 else 0)
            trit_y = -1 if dist_y < 0 else (1 if dist_y > 0 else 0)
            if trit_y != 0: preferred_moves.append((0, trit_y))
            if trit_x != 0: preferred_moves.append((trit_x, 0))

        # Add remaining 2 directions as fallback
        for cand in [(1, 0), (-1, 0), (0, 1), (0, -1)]:
            if cand not in preferred_moves:
                preferred_moves.append(cand)

        # Pick first safe move (no wall, no self collision)
        for dx, dy in preferred_moves:
            # Cannot reverse direction
            if (dx, dy) == (-self.dir_x, -self.dir_y):
                continue
            next_head = (head_x + dx, head_y + dy)
            if (0 <= next_head[0] < GRID_WIDTH and
                0 <= next_head[1] < GRID_HEIGHT and
                next_head not in self.snake[:-1]):
                self.next_dir_x = dx
                self.next_dir_y = dy
                return

    def game_loop(self):
        if self.running:
            self.step_count += 1

            if self.auto_pilot:
                self.setun_ai_step()

            self.dir_x = self.next_dir_x
            self.dir_y = self.next_dir_y

            head_x, head_y = self.snake[0]
            new_head = (head_x + self.dir_x, head_y + self.dir_y)

            # Check Wall Collision
            if not (0 <= new_head[0] < GRID_WIDTH and 0 <= new_head[1] < GRID_HEIGHT):
                if self.auto_pilot:
                    # In AI mode, wrap around or turn safely
                    new_head = (new_head[0] % GRID_WIDTH, new_head[1] % GRID_HEIGHT)
                else:
                    self.game_over()
                    return

            # Check Self Collision
            if new_head in self.snake:
                if not self.auto_pilot:
                    self.game_over()
                    return

            # Advance Snake
            self.snake.insert(0, new_head)

            # Check Food Collision
            if new_head == self.food:
                self.score += 10
                self.spawn_food()
            else:
                self.snake.pop()

            self.render()
            self.update_hud()

        self.root.after(self.speed_ms, self.game_loop)

    def game_over(self):
        self.running = False
        self.canvas.create_rectangle(BOARD_WIDTH//4, BOARD_HEIGHT//3,
                                     3*BOARD_WIDTH//4, 2*BOARD_HEIGHT//3,
                                     fill=COLORS["bg_dark"], outline=COLORS["food"], width=2)
        self.canvas.create_text(BOARD_WIDTH//2, BOARD_HEIGHT//2 - 14,
                                text="GAME OVER", font=("Segoe UI", 18, "bold"), fill=COLORS["food"])
        self.canvas.create_text(BOARD_WIDTH//2, BOARD_HEIGHT//2 + 16,
                                text=f"Score: {self.score}  |  Press 'Restart'",
                                font=("Segoe UI", 11), fill=COLORS["text_white"])

    def render(self):
        self.canvas.delete("all")

        # Draw Grid Lines (Subtle)
        for x in range(0, BOARD_WIDTH, CELL_SIZE):
            self.canvas.create_line(x, 0, x, BOARD_HEIGHT, fill=COLORS["grid_line"], width=1)
        for y in range(0, BOARD_HEIGHT, CELL_SIZE):
            self.canvas.create_line(0, y, BOARD_WIDTH, y, fill=COLORS["grid_line"], width=1)

        # Draw Food (Glowing Orb)
        fx, fy = self.food
        cx, cy = fx * CELL_SIZE + CELL_SIZE // 2, fy * CELL_SIZE + CELL_SIZE // 2
        r = CELL_SIZE // 2 - 2
        # Glow halo
        self.canvas.create_oval(cx - r - 4, cy - r - 4, cx + r + 4, cy + r + 4,
                                fill=COLORS["food_glow"], outline="")
        # Food body
        self.canvas.create_oval(cx - r, cy - r, cx + r, cy + r,
                                fill=COLORS["food"], outline="#ffffff", width=1)

        # Draw Snake Body
        for i, (sx, sy) in enumerate(self.snake[1:]):
            x1 = sx * CELL_SIZE + 2
            y1 = sy * CELL_SIZE + 2
            x2 = x1 + CELL_SIZE - 4
            y2 = y1 + CELL_SIZE - 4
            # Color gradient along body
            ratio = i / max(1, len(self.snake))
            body_color = COLORS["snake_body"]
            self.canvas.create_rectangle(x1, y1, x2, y2, fill=body_color, outline="#005580", width=1)

        # Draw Snake Head
        hx, hy = self.snake[0]
        hx1 = hx * CELL_SIZE + 1
        hy1 = hy * CELL_SIZE + 1
        hx2 = hx1 + CELL_SIZE - 2
        hy2 = hy1 + CELL_SIZE - 2
        self.canvas.create_rectangle(hx1, hy1, hx2, hy2, fill=COLORS["snake_head"], outline="#ffffff", width=2)

        # Draw Head Direction Eyes
        eye_r = 2
        ecx = hx * CELL_SIZE + CELL_SIZE // 2 + self.dir_x * 4
        ecy = hy * CELL_SIZE + CELL_SIZE // 2 + self.dir_y * 4
        self.canvas.create_oval(ecx - eye_r, ecy - eye_r, ecx + eye_r, ecy + eye_r, fill="#070b14", outline="")

    def update_hud(self):
        head_x, head_y = self.snake[0]
        food_x, food_y = self.food

        self.lbl_score.config(text=str(self.score))
        self.lbl_steps.config(text=str(self.step_count))
        self.lbl_length.config(text=str(len(self.snake)))

        self.lbl_head_pos.config(text=f"({head_x}, {head_y})")
        self.lbl_food_pos.config(text=f"({food_x}, {food_y})")

        # TAFPU in Q(sqrt(3)): Norm = head_x + head_y * sqrt(3)
        self.lbl_exact_alg.config(text=f"{head_x} + {head_y}√3")
        approx_val = head_x + head_y * math.sqrt(3)
        self.lbl_float_approx.config(text=f"≈ {approx_val:.4f}")

        # Trits
        name_x = "+1 (Right)" if self.dir_x == 1 else ("-1 (Left)" if self.dir_x == -1 else " 0 (None)")
        name_y = "+1 (Down)" if self.dir_y == 1 else ("-1 (Up)" if self.dir_y == -1 else " 0 (None)")
        self.lbl_trit_x.config(text=name_x)
        self.lbl_trit_y.config(text=name_y)

        self.lbl_branch_x.config(text=self.last_branch_x)
        self.lbl_branch_y.config(text=self.last_branch_y)

def main():
    root = tk.Tk()
    app = SetunSnake2D(root)
    root.mainloop()

if __name__ == "__main__":
    main()
