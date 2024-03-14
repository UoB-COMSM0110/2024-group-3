package org.uob;

import processing.core.PApplet;

public class MenuBar{
    private int timeElapsed;
    private int score;
    private boolean venomActive;

    public int getTimeElapsed() {
        return this.timeElapsed;
    }

    public void setTimeElapsed(int timEla) {
        this.timeElapsed=timEla;
        return;
    }

    public int getScore() {
        return this.score;
    }
    public void setScore(int sco) {
        this.score=sco;
        return;
    }

    public boolean getVenomActive() {
        return this.venomActive;
    }
    public void setVenomActive(boolean venAct) {
        this.venomActive=venAct;
        return;
    }
    public MenuBar(int time, int sco, boolean venAct) {
        this.timeElapsed=time;
        this.score=sco;
        this.venomActive=venAct;
        return;
    }
}
