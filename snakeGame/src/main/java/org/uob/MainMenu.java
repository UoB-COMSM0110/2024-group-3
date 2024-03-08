package org.uob;

import processing.core.PApplet;

public class MainMenu extends PApplet {
    public void game(){
        textSize(64);
        fill(0);
        textAlign(CENTER, CENTER);
        text("Snake Game", width/2, height/10);
        text("Star game", width/2, 600);
        text("High score", width/2, 700);
        text("Help", width/2, 800);
    }
}
