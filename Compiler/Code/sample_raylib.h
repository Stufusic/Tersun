// Sample Raylib subset header for testing setunc bindgen
struct Vector2 {
    float x;
    float y;
};

struct Vector3 {
    float x;
    float y;
    float z;
};

struct Color {
    int r;
    int g;
    int b;
    int a;
};

void InitWindow(int width, int height, const char* title);
void CloseWindow(void);
bool WindowShouldClose(void);
void BeginDrawing(void);
void EndDrawing(void);
void ClearBackground(Color color);
void DrawText(const char* text, int posX, int posY, int fontSize, Color color);
void DrawCircleV(Vector2 center, float radius, Color color);
double GetFrameTime(void);
