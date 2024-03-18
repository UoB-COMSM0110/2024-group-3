class MainMenu extends ScreenPanel {
    // Constructor to initialize position and size
    public MainMenu(PApplet game, float x, float y, float width, float height) {
        super(game, x, y, width, height);
    }

    public void update() {
        // Implement update logic for Panel 1
    }

    public void draw() {
        // Draw Panel 1 at the specified position and size
        game.rect(x, y, width, height);
    }
}
