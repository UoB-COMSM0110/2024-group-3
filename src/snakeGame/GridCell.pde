abstract class GridCell {
  protected final PVector gridLocation;
  protected int colour;

  public GridCell(PVector gridLocation, int colour) {
    this.gridLocation = gridLocation;
    this.colour = colour;
  }

  protected void fillGridCell() {
    float i = gridLocation.array()[0] * CELL_SIZE;
    float j = gridLocation.array()[1] * CELL_SIZE;
    fill(colour);
    rect(i, j, CELL_SIZE, CELL_SIZE);
  }

  public PVector getGridLocation() {
    return gridLocation;
  }

  public int getColour() {
    return colour;
  }

  public void setColour(int colour) {
    this.colour = colour;
  }

  public int getX() {
    return (int)gridLocation.array()[0];
  }

  public int getY() {
    return (int)gridLocation.array()[1];
  }
}
