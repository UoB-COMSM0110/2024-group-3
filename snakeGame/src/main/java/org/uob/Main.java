package org.uob;

import processing.core.PApplet;

import java.awt.*;

public class Main extends PApplet {
    public static void main(String[] args) {
        PApplet.main("org.uob.Main");
    }

    // Grid/Map Constants
    final int ROWS = 100; //100 before
    final int COLS = 150; //150 before
    final int CELL_SIZE = 12;

    // Direction constants
    final int UP = 0;
    //final int RIGHT = 1;
    final int DOWN = 2;
    //final int LEFT = 3;

    int currentPage=0;
    int width=COLS*CELL_SIZE;
    int height=ROWS*CELL_SIZE;
    private MenuBar menuBar=new MenuBar(0,0,false);
    public void settings()
    {
        size(COLS * CELL_SIZE, ROWS * CELL_SIZE);
    }

    public void setup() {
        currentPage=0;
        frameRate(10);
    }

    public void draw() {
        if (currentPage==0) {
//            MainMenu mainMenu=new MainMenu();
//            mainMenu.game();
            textSize(32);
            fill(0);
            textAlign(CENTER, CENTER);

            noFill();
            text("Snake Game", width/2, height/10);

            rect(width/2-130,height/2-30,250,80);
            text("Star game", width/2, height/2);

            rect(width/2-130,height/2+70,250,80);
            text("High score", width/2, height/12*7);

            rect(width/2-130,height/2+170,250,80);
            text("Help", width/2, height/3*2);
        }
        //game map
        else if (currentPage==1) {
            background(60); // Darkish grey background
            drawGridLines();
            drawMenuBar();
        }
        //high scores
        else if (currentPage==2) {
            fill(0);
            textAlign(CENTER, CENTER);
            textSize(120);
            text("High Score", (width / 2), 130);
            textSize(70);
            text("Name1", width/3, 500);
            text("Socre1", 1100, 500);
            text("Name2", 700, 650);
            text("Socre2", 1100, 650);
        }
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

    public void mousePressed() {
        if (mouseX>770 && mouseX<1020 && mouseY>570 && mouseY<650) {
            if (mouseButton==LEFT) {
                currentPage=1;
            }
        }
        else if (mouseX>770 && mouseX<1020 && mouseY>670 && mouseY<750) {
            if (mouseButton==LEFT) {
                currentPage=2;
            }
        }
        else if (mouseX>770 && mouseX<1020 && mouseY>770 && mouseY<850) {
            if (mouseButton==LEFT) {
                currentPage=3;
            }
        }
        return;
    }
}
