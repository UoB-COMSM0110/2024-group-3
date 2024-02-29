package org.uob;

//import processing.core.PApplet;
import processing.core.*;

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
            background(255);

            textSize(32);
            fill(0);
            textAlign(CENTER, CENTER);

            noFill();
            text("Snake Game", width/2, height/10);

            Button sg_but=new Button(width/2-130,height/2-30,width/2+120,height/2+50,1,"Start game");
            drawButton(sg_but);

            Button hs_but=new Button(width/2-130,height/2+70,width/2+120,height/2+150,1,"High Score");
            drawButton(hs_but);

            Button help_but=new Button(width/2-130,height/2+170,width/2+120,height/2+250,1,"Help");
            drawButton(help_but);
//            rect(width/2-130,height/2+170,250,80);
//            text("Help", width/2, height/3*2);
        }
        //game map
        else if (currentPage==1) {
            background(60); // Darkish grey background
            drawGridLines();
            drawMenuBar();
        }
        //high scores
        else if (currentPage==2) {
            background(255);
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

    public void drawButton(Button but) {
        rect(but.getX(),but.getY(),but.getW()-but.getX(),but.getV()-but.getY());

        textAlign(CENTER,CENTER);
        int length=but.getTxt().length();
        text(but.getTxt(),(but.getW()+but.getX())/2,(but.getV()+but.getY())/2);
        return;
    }

    public void mousePressed() {
        if (currentPage==0) {
            if (mouseX > 770 && mouseX < 1020 && mouseY > 570 && mouseY < 650) {
                if (mouseButton == LEFT) {
                    currentPage = 1;
                }
            } else if (mouseX > 770 && mouseX < 1020 && mouseY > 670 && mouseY < 750) {
                if (mouseButton == LEFT) {
                    currentPage = 2;
                }
            } else if (mouseX > 770 && mouseX < 1020 && mouseY > 770 && mouseY < 850) {
                if (mouseButton == LEFT) {
                    currentPage = 3;
                }
            }
        }
        return;
    }

    public void keyPressed() {
        if (keyCode==ESC) {
            currentPage=0;
            key=0;
        }
        return;
    }
}
