package setun2d;

import javax.swing.JFrame;
import java.awt.Canvas;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Toolkit;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/**
 * ============================================================================
 * SETUN 2.0 - JAVA 2D HARDWARE-ACCELERATED GRAPHICS RENDERER
 * Engine hiển thị đồ họa 2D tăng tốc GPU, Double Buffering 60 FPS, 0% Nhấp Nháy
 * ============================================================================
 */
public class Setun2DRenderer {

    // Protocol Opcodes
    public static final byte OP_INIT        = 0x01;
    public static final byte OP_CLEAR       = 0x02;
    public static final byte OP_DRAW_RECT   = 0x03;
    public static final byte OP_DRAW_CIRCLE = 0x04;
    public static final byte OP_DRAW_TEXT   = 0x05;
    public static final byte OP_FLIP        = 0x06;
    public static final byte OP_GET_KEY     = 0x07;
    public static final byte OP_IS_RUNNING  = 0x08;
    public static final byte OP_CLOSE       = (byte) 0xFF;

    private JFrame frame;
    private Canvas canvas;
    private BufferedImage backBuffer;
    private Graphics2D g2d;
    private volatile boolean running = true;
    private volatile byte currentKey = 0; // Trit: -1 (Left), 0 (None), +1 (Right), 2 (Up), -2 (Down)

    private int width = 800;
    private int height = 600;

    public void start(InputStream inStream) {
        try (DataInputStream in = new DataInputStream(new BufferedInputStream(inStream));
             DataOutputStream out = new DataOutputStream(System.out)) {

            while (running) {
                int op = in.read();
                if (op == -1) break; // EOF from parent process

                byte opcode = (byte) op;
                switch (opcode) {
                    case OP_INIT: {
                        int w = in.readInt();
                        int h = in.readInt();
                        int titleLen = in.readShort();
                        byte[] titleBytes = new byte[titleLen];
                        in.readFully(titleBytes);
                        String title = new String(titleBytes, StandardCharsets.UTF_8);
                        initWindow(w, h, title);
                        break;
                    }
                    case OP_CLEAR: {
                        int rgb = in.readInt();
                        if (g2d != null) {
                            g2d.setColor(new Color(rgb));
                            g2d.fillRect(0, 0, width, height);
                        }
                        break;
                    }
                    case OP_DRAW_RECT: {
                        int x = in.readInt();
                        int y = in.readInt();
                        int w = in.readInt();
                        int h = in.readInt();
                        int rgb = in.readInt();
                        if (g2d != null) {
                            g2d.setColor(new Color(rgb));
                            g2d.fillRect(x, y, w, h);
                        }
                        break;
                    }
                    case OP_DRAW_CIRCLE: {
                        int cx = in.readInt();
                        int cy = in.readInt();
                        int r = in.readInt();
                        int rgb = in.readInt();
                        if (g2d != null) {
                            g2d.setColor(new Color(rgb));
                            g2d.fillOval(cx - r, cy - r, r * 2, r * 2);
                        }
                        break;
                    }
                    case OP_DRAW_TEXT: {
                        int x = in.readInt();
                        int y = in.readInt();
                        int rgb = in.readInt();
                        int len = in.readShort();
                        byte[] textBytes = new byte[len];
                        in.readFully(textBytes);
                        String text = new String(textBytes, StandardCharsets.UTF_8);
                        if (g2d != null) {
                            g2d.setColor(new Color(rgb));
                            g2d.setFont(new Font("Segoe UI", Font.BOLD, 13));
                            g2d.drawString(text, x, y);
                        }
                        break;
                    }
                    case OP_FLIP: {
                        // Copy off-screen backBuffer to canvas graphics (100% Zero Flicker)
                        if (canvas != null && backBuffer != null) {
                            Graphics g = canvas.getGraphics();
                            if (g != null) {
                                g.drawImage(backBuffer, 0, 0, null);
                                g.dispose();
                            }
                            Toolkit.getDefaultToolkit().sync();
                        }

                        // Smooth 60 FPS pacing (~16ms)
                        try {
                            Thread.sleep(16);
                        } catch (InterruptedException ignored) {}

                        // Send key and running status back to C++
                        byte keyToSend = currentKey;
                        out.writeByte(running ? 1 : 0);
                        out.writeByte(keyToSend);
                        out.flush();
                        break;
                    }
                    case OP_GET_KEY: {
                        out.writeByte(currentKey);
                        out.flush();
                        break;
                    }
                    case OP_IS_RUNNING: {
                        out.writeByte(running ? 1 : 0);
                        out.flush();
                        break;
                    }
                    case OP_CLOSE: {
                        running = false;
                        if (frame != null) frame.dispose();
                        return;
                    }
                }
            }
        } catch (Exception e) {
            // Terminated
        } finally {
            if (frame != null) {
                frame.dispose();
            }
            System.exit(0);
        }
    }

    private void initWindow(int w, int h, String title) {
        this.width = w;
        this.height = h;

        // Off-screen Double Buffer (Eliminates 100% of Screen Flicker)
        backBuffer = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        g2d = backBuffer.createGraphics();
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2d.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

        frame = new JFrame(title);
        frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
        frame.setResizable(false);
        frame.setIgnoreRepaint(true);

        canvas = new Canvas();
        canvas.setPreferredSize(new Dimension(width, height));
        canvas.setBackground(new Color(0x07, 0x0b, 0x14));
        canvas.setFocusable(true);
        canvas.setIgnoreRepaint(true);

        frame.add(canvas);
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);

        // Keyboard listener
        canvas.addKeyListener(new KeyAdapter() {
            @Override
            public void keyPressed(KeyEvent e) {
                switch (e.getKeyCode()) {
                    case KeyEvent.VK_LEFT:
                    case KeyEvent.VK_A:
                        currentKey = -1; // Trit -1
                        break;
                    case KeyEvent.VK_RIGHT:
                    case KeyEvent.VK_D:
                        currentKey = 1;  // Trit +1
                        break;
                    case KeyEvent.VK_UP:
                    case KeyEvent.VK_W:
                        currentKey = 2;  // Up
                        break;
                    case KeyEvent.VK_DOWN:
                    case KeyEvent.VK_S:
                        currentKey = -2; // Down
                        break;
                    case KeyEvent.VK_SPACE:
                        currentKey = 3;  // Space
                        break;
                }
            }
        });

        frame.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                running = false;
                frame.dispose();
            }
        });

        canvas.requestFocus();
    }

    public static void main(String[] args) {
        Setun2DRenderer renderer = new Setun2DRenderer();
        renderer.start(System.in);
    }
}
