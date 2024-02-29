package org.uob;

import processing.core.PApplet;
import java.util.ArrayList;

public class Main extends PApplet {
    public static void main(String[] args) {
        PApplet.main("org.uob.Main");
    }

    // Grid/Map Constants
    final int ROWS = 50;
    final int COLS = 100;

    // Direction constants
    final int UP = 0;
    final int RIGHT = 1;
    final int DOWN = 2;
    final int LEFT = 3;

    public void settings() {
        size(COLS * GridCell.cellSize, ROWS * GridCell.cellSize);
    }

    public void setup() {
        frameRate(10);
        background(60);
        drawGridLines();
        makeWalls();
        makeFood();
    }
    public void draw() {
    }

    private void drawGridLines() {
        stroke(100);

        // Draw vertical lines
        for (int i = 0; i <= COLS; i++) {
            float x = i * GridCell.cellSize;
            line(x, 0, x, height);
        }

        // Draw horizontal lines
        for (int j = 0; j <= ROWS; j++) {
            float y = j * GridCell.cellSize;
            line(0, y, width, y);
        }
    }

    private void makeWalls() {
        ArrayList<int[]> wallCellLocations = new ArrayList<>();
        wallCellLocations.add(new int[]{1, 1});
        wallCellLocations.add(new int[]{1, 2});
        WallObject wall = new WallObject(this, wallCellLocations);
    }

    private void makeFood() {
        ArrayList<FoodCell> food = new ArrayList<>();
        food.add(new FoodCell(this, new int[]{5,7}, "apple"));
        food.add(new FoodCell(this, new int[]{8,3}, "banana"));
        food.add(new FoodCell(this, new int[]{1,35}, "cherry"));
    }

}
