import java.util.ArrayList;

abstract class Consumable extends GridCell {
  protected int colour;
  protected GameScreen game;
  protected ArrayList<PVector> shape = new ArrayList<>();
  int potentialRow;
  int potentialColumn;

  public Consumable(GameScreen game, PVector gridLocation, int colour) {
    super(gridLocation, colour);
    this.game = game;
    game.setMapGridObjectData((int) gridLocation.x, (int)gridLocation.y, this);
    this.colour = colour;
  }

  abstract void renderConsumable();

  abstract public void setRandomConsumableLocation();

  protected void findGridLocation() {
    for (PVector cell : this.shape) {
      while (this.game.getMapGridObjectData(potentialColumn + (int)cell.x, potentialRow + (int)cell.y) != null) {
        this.potentialColumn = (int)(Math.random() * (COLS - 1));
        this.potentialRow = (int)(Math.random() * (ROWS - 1));
      }
    }
    this.gridLocation.x = this.potentialColumn;
    this.gridLocation.y = this.potentialRow;
  }

  protected void setConsumableMapGridObjectData() {
    for (PVector cell : this.shape) {
      this.game.setMapGridObjectData(new PVector(potentialColumn + (int)cell.x, potentialRow + (int)cell.y), this);
    }
  }

  protected void clearConsumableMapGridObjectData(int oldColumn, int oldRow) {
    for (PVector cell : this.shape) {
      this.game.setMapGridObjectData(new PVector(oldColumn + (int)cell.x, oldRow + (int)cell.y), null);
    }
  }

  public void cleanUp() {
    // Clear the map grid data associated with this consumable
    clearConsumableMapGridObjectData((int) gridLocation.x, (int) gridLocation.y);
  }
}
