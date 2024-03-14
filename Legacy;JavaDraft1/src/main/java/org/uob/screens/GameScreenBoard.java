package org.uob.screens;


// add some function to track maximum grid positions can use when in grid section

import org.uob.Main;
import org.uob.boards.FoodCell;
import org.uob.boards.GridCell;
import org.uob.boards.WallObject;
import processing.core.PApplet;

import java.util.ArrayList;

public class GameScreenBoard extends ScreenPanel {
    // Constructor to initialize position and size
    public GameScreenBoard(PApplet game, float x, float y, float width, float height) {
        super(game, x, y, width, height);
    }

    public void update() {
        // Implement update logic for Panel 1
    }

    public void draw() {
        game.pushMatrix();
        game.translate(x, y);
        game.fill(80);
        game.rect(0, 0, width, height);
        game.fill(60);
        drawGridLines();
        makeWalls();
        makeFood();
        game.popMatrix();
    }

    private void drawGridLines() {
        game.stroke(100);

        // Draw vertical lines
        for (int i = 0; i <= Main.COLS; i++) {
            float x = i * GridCell.cellSize;
            game.line(x, 0, x, game.height);
        }

        // Draw horizontal lines
        for (int j = 0; j <= Main.ROWS; j++) {
            float y = j * GridCell.cellSize;
            game.line(0, y, game.width, y);
        }
    }

    private void makeWalls() {
        ArrayList<int[]> wallCellLocations = new ArrayList<>();
        wallCellLocations.add(new int[]{0, 0});
        wallCellLocations.add(new int[]{0, 1});
        wallCellLocations.add(new int[]{1, 1});
        wallCellLocations.add(new int[]{1, 2});
        WallObject wall = new WallObject(game, wallCellLocations);
    }

    private void makeFood() {
        ArrayList<FoodCell> food = new ArrayList<>();
        food.add(new FoodCell(game, new int[]{0,5}, "apple"));
        food.add(new FoodCell(game, new int[]{0,44}, "banana"));
        food.add(new FoodCell(game, new int[]{0,50}, "cherry"));
    }
}

