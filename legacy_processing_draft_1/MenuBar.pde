class MenuBar {
    private int timeElapsed;
    private int score;
    private boolean venomActive;

    public int getTimeElapsed() {
        return this.timeElapsed;
    }

    public void setTimeElapsed(int timEla) {
        this.timeElapsed = timEla;
    }

    public int getScore() {
        return this.score;
    }

    public void setScore(int sco) {
        this.score = sco;
    }

    public boolean getVenomActive() {
        return this.venomActive;
    }

    public void setVenomActive(boolean venAct) {
        this.venomActive = venAct;
    }

    public MenuBar(int time, int sco, boolean venAct) {
        this.timeElapsed = time;
        this.score = sco;
        this.venomActive = venAct;
    }
}
