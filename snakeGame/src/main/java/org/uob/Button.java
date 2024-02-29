package org.uob;

import processing.core.PApplet;

public class Button {
    private int x,y,w,v;
    private int pagePoi;
    private String txt;
    private int col=255;

    private int txtsize=32;

    public Button(int x, int y, int w, int v, int pagePoi, String txt) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.v = v;
        this.pagePoi = pagePoi;
        this.txt = txt;
//
//        this.fill(col);
//        this.rect(x,y,w-x,v-y);
//
//        //textAlign(CENTER, CENTER);
//        int length=txt.length();
//        text(txt,(w+x)/2-length*txtSiz/2,(y+v)/2-txtSiz/2);
//
//        this.drawButton();
        //w-x/2-length*textsize()/2
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public int getW() {
        return w;
    }

    public int getV() {
        return v;
    }

    public int getPagePoi() {
        return pagePoi;
    }

    public String getTxt() {
        return txt;
    }

    public int getCol() {
        return col;
    }

    public int getTxtsize() {
        return txtsize;
    }
//    public void drawButton() {
//        rect(x,y,w-x,v-y);
//        text(txt,x,y);
//    }
}
