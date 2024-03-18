package org.uob;

//import processing.core.PApplet;
import java.awt.*;
import processing.core.*;

public abstract class Screens {
    private int length;
    private int width;

    private PApplet canvas;

    public Screens(PApplet can,int leng,int wid) {
        this.canvas=can;
        this.length=leng;
        this.width=wid;
        return;
    }
    private int getLength() {
        return this.length;
    }

    private int getWidth() {
        return this.width;
    }
    protected void lauchScreen() {}

    protected void playaudio() {}
}
