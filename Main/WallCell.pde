class WallCell extends GridCell {
    public WallCell(PApplet game, int[] gridLocation, int colour) {
        super(game, gridLocation, colour);
        fillGridCell(game, gridLocation, colour);
    }
}
