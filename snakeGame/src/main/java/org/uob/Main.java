package org.uob;

import org.uob.boards.GridCell;
import org.uob.screens.GameScreen;
import processing.core.PApplet;

public class Main extends PApplet {

    public static final int ROWS = 50;
    public static final int COLS = 100;

    // Direction constants
    final int UP = 0;
    final int RIGHT = 1;
    final int DOWN = 2;
    final int LEFT = 3;

    // Screens
    GameScreen gameScreen;

    public static void main(String[] args) {
        PApplet.main("org.uob.Main");
    }

    public void settings() {
        size(COLS * GridCell.cellSize, ROWS * GridCell.cellSize);
    }

    public void setup() {
        gameScreen = new GameScreen(this);
        gameScreen.update();
        gameScreen.draw();
    }
    public void draw() {

    }
}
