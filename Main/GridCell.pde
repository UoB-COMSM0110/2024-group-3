abstract class GridCell {
    private final int[] gridLocation;
    public static final int cellSize = 15;

    private int colour;

    private final PApplet game;

    public GridCell(PApplet game, int[] gridLocation) {
        this.game = game;
        this.gridLocation = gridLocation;
    }

    public GridCell(PApplet game, int[] gridLocation, int colour) {
        this(game, gridLocation);
        this.colour = colour;
    }

    protected void fillGridCell(PApplet game, int[] gridLocation, int colour) {
        float i = gridLocation[0] * GridCell.cellSize;
        float j = gridLocation[1] * GridCell.cellSize;
        game.fill(colour);
        game.rect(i, j, GridCell.cellSize, GridCell.cellSize);
    }

    public int[] getGridLocation() {
        return gridLocation;
    }

    public int getColour() {
        return colour;
    }

    public void setColour(int colour) {
        this.colour = colour;
    }
    
    public PApplet getGame() {
        return this.game;
    }
}
