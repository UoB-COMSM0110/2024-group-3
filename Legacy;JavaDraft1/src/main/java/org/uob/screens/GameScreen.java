package org.uob.screens;

import org.uob.boards.GridCell;
import processing.core.PApplet;

import java.util.ArrayList;

public class GameScreen {
    // Composition: Screen contains multiple ScreenPanel objects
    ArrayList<ScreenPanel> panels;
    PApplet game;

    public GameScreen(PApplet game) {
        this.game = game;
        panels = new ArrayList<ScreenPanel>();

        int menuBarCellHeight = 5;

        float menuBarHeight = menuBarCellHeight * GridCell.cellSize; // Adjust as needed
        float boardWidth = game.width;
        float boardHeight = game.height - menuBarHeight;

        // Add the menu bar panel at the top of the screen
        panels.add(new GameScreenMenuBar(game, 0, 0, game.width, menuBarHeight));

        // Add the board panel below the menu bar
        panels.add(new GameScreenBoard(game, 0, menuBarHeight, boardWidth, boardHeight));
    }

    // Method to update all panels of the screen
    public void update() {
        for (ScreenPanel panel : panels) {
            panel.update();
        }
    }

    // Method to draw all panels of the screen
    public void draw() {
        for (ScreenPanel panel : panels) {
            panel.draw();
        }
    }
}


