package org.uob;

import processing.core.PApplet;

import java.awt.*;

public class Main extends PApplet {
    public static void main(String[] args) {
        PApplet.main("org.uob.Main");
    }

    // Grid/Map Constants
    final int ROWS = 100;
    final int COLS = 150;
    final int CELL_SIZE = 12;

    // Direction constants
    final int UP = 0;
    final int RIGHT = 1;
    final int DOWN = 2;
    final int LEFT = 3;

    private MenuBar menuBar=new MenuBar(0,0,false);
    public void settings()
    {
        size(COLS * CELL_SIZE, ROWS * CELL_SIZE);
    }

    public void setup() {
        frameRate(10);
    }

    public void draw() {
        background(60); // Darkish grey background
        drawGridLines();
        drawMenuBar();
    }

    private void drawMenuBar() {
        fill(0);
        rect(0, 0, width, 40);

        fill(255);
        textSize(20);
        textAlign(LEFT, CENTER);
        text("Time: " + menuBar.getTimeElapsed(), 60, 20);

        textAlign(CENTER, CENTER);
        text("Score: " + menuBar.getScore(), width/2, 20);

        textAlign(RIGHT, CENTER);
        String activeText = menuBar.getVenomActive() ? "Active" : "Inactive";
        text("VenomStatus: " + activeText, width - 300, 20);
        return;
    }
    private void drawGridLines() {
        stroke(100);

        // Draw vertical lines
        for (int i = 0; i <= COLS; i++) {
            float x = i * CELL_SIZE;
            line(x, 0, x, height);
        }

        // Draw horizontal lines
        for (int j = 0; j <= ROWS; j++) {
            float y = j * CELL_SIZE;
            line(0, y, width, y);
        }
    }
}
