import java.util.ArrayList;

abstract class Consumable extends GridCell {
  protected int colour;
  protected GameScreen game;
  protected ArrayList<PVector> shape = new ArrayList<>();
  int potentialRow;
  int potentialColumn;
  static final int boundsOffset = 2;

  public Consumable(GameScreen game, PVector gridLocation, int colour) {
    super(gridLocation, colour);
    this.game = game;
    game.setMapGridObjectData((int) gridLocation.x, (int)gridLocation.y, this);
    this.colour = colour;
  }

  abstract void renderConsumable();

  abstract public void setRandomConsumableLocation();

  protected void findGridLocation() {
    boolean validLocationFound;
    do {
        validLocationFound = true;
        //subtract double the bounds offset to offset the offset
        this.potentialColumn = boundsOffset + (int)(Math.random() * (COLS - boundsOffset * 2));
        this.potentialRow = boundsOffset + (int)(Math.random() * (ROWS - boundsOffset * 2));
        validLocationFound = isWholeShapeValid();
        
    } while (!validLocationFound);
    this.gridLocation.x = this.potentialColumn;
    this.gridLocation.y = this.potentialRow;
}

  protected boolean isWholeShapeValid() {
    for (PVector cell : this.shape) {
        int checkColumn = potentialColumn + (int)cell.x;
        int checkRow = potentialRow + (int)cell.y;
        boolean outOfBounds = checkColumn >= COLS || checkRow >= ROWS || checkColumn < boundsOffset || checkRow < boundsOffset; 
        boolean isOccupied = this.game.getMapGridObjectData(checkColumn, checkRow) != null;
        if (outOfBounds || isOccupied) {
            return false; 
        }        
    }
    return true;
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
