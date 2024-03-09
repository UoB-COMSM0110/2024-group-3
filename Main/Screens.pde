abstract class Screens {
    private int length;
    private int width;

    private PApplet canvas;

    public Screens(PApplet can, int leng, int wid) {
        this.canvas = can;
        this.length = leng;
        this.width = wid;
    }

    protected int getLength() {
        return this.length;
    }

    protected int getWidth() {
        return this.width;
    }

    protected void lauchScreen() {}

    protected void playaudio() {}
}
