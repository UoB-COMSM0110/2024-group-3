package org.uob;

import processing.core.PApplet;

import java.awt.*;

public class Button {
    private int x,y,w,v;
    private int curPag;
    private int pagePoi;
    private String txt;

    private int colr=110,colg=110,colb=110;

    private int txtsize=32;

    public Button(int x, int y, int w, int v,int curPag, int pagePoi, String txt) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.v = v;
        this.curPag=curPag;
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

    public int getCurPag() {
        return curPag;
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
        return colr;
    }

    public int getTxtsize() {
        return txtsize;
    }

    public void setColour(int colr,int colg,int colb) {
        this.colr=colr;
        this.colg=colg;
        this.colb=colb;
        return;
    }

    public int getColr() {
        return colr;
    }

    public int getColg() {
        return colg;
    }

    public int getColb() {
        return colb;
    }

    public boolean inside(int mouseX, int mouseY) {
        return (mouseX>this.x) && (mouseX<this.w) && (mouseY>this.y) && (mouseY<this.v);
    }
//    public void drawButton() {
//        rect(x,y,w-x,v-y);
//        text(txt,x,y);
//    }
}
