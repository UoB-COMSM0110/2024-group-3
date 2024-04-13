class Button {
    private int x, y, w, v;
    private WhatPage curPag,pagePoi;
    private String txt;

    private int colr = 255, colg = 255, colb = 255;
    private int bgColr =255, bgColg = 255, bgColb = 255;

    private int txtsize = 32;
    public int hover=0;

    public Button(int x, int y, int w, int v, WhatPage curPag, WhatPage pagePoi, String txt, int txtsize) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.v = v;
        this.curPag = curPag;
        this.pagePoi = pagePoi;
        this.txt = txt;
        this.txtsize=txtsize;
    }

    public WhatPage getCurPag() {
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

    public WhatPage getPagePoi() {
        return pagePoi;
    }

    public String getTxt() {
        return txt;
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

    public void setBgColour(int colr,int colg,int colb) {
        this.bgColr = colr;
        this.bgColg = colg;
        this.bgColb = colb;
    }

    public void setColour(int colr, int colg, int colb) {
        this.colr = colr;
        this.colg = colg;
        this.colb = colb;
    }

    public boolean inside(int mouseX, int mouseY) {
        return mouseX > this.x && mouseX < this.w && mouseY > this.y && mouseY < this.v;
    }
}
