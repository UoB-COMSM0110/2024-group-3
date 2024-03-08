package org.uob.screens;


import processing.core.PApplet;

class MainMenu extends ScreenPanel {
    // Constructor to initialize position and size
    MainMenu(PApplet game, float x, float y, float width, float height) {
        super(game, x, y, width, height);
    }

    void update() {
        // Implement update logic for Panel 1
    }

    void draw() {
        // Draw Panel 1 at the specified position and size
        game.rect(x, y, width, height);
    }
}
