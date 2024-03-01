package org.uob.screens;

import org.uob.screens.*;
import processing.core.PApplet;

public class GameScreenMenuBar extends ScreenPanel {

    // Constructor to initialize position and size
    GameScreenMenuBar(PApplet game, float x, float y, float width, float height) {
        super(game, x, y, width, height);
    }

    public void update() {
        // Implement update logic for Panel 1
    }

    public void draw() {
        // Draw Panel 1 at the specified position and size
        game.fill(70);
        game.rect(x, y, width, height);

    }
}
