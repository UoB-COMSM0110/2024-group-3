abstract class ScreenPanel {
    PApplet game;
    float x, y; // Position of the panel
    float width, height; // Size of the panel

    // Constructor to initialize position and size
    public ScreenPanel(PApplet game, float x, float y, float width, float height) {
        this.game = game;
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    // Abstract method to update the screen panel
    public abstract void update();

    // Abstract method to draw the screen panel
    public abstract void draw();
}
