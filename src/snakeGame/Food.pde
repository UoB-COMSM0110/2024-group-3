import java.util.ArrayList;

public abstract class Food extends Consumable {
  int potentialRow;
  int potentialColumn;

  // At game start, no food is eaten
  int foodEaten = 0;

  public Food(GameScreen game, PVector gridLocation, int colour) {
    super(game, gridLocation, colour);
    this.mapGridObjectData = new Object[height][width];
  }

  @Override
    public void renderConsumable() {
    for (PVector cell : this.shape) {

      // Offset gridLocation with cell location
      float i = (this.gridLocation.x + cell.x) * CELL_SIZE;
      float j = (this.gridLocation.y + cell.y) * CELL_SIZE;

      // Each concrete implementation of this class has its own colour
      fill(this.colour);

      // Create a square the size of a GridCell
      rect(i, j, CELL_SIZE, CELL_SIZE);
    }
  }

  public void setRandomConsumableLocation() {
    int oldColumn = (int) this.gridLocation.x;
    int oldRow = (int) this.gridLocation.y;
    findGridLocation();

    // Add food to grid metadata
    setConsumableMapGridObjectData();

    // When food is eaten, clear it from metadata
    clearConsumableMapGridObjectData(oldColumn, oldRow);

    // Assert that consumable cleared from metadata
    assert getMapGridObjectData(oldColumn, oldRow) == null;

    // Keep track of food score for UI display
    incrementFoodCount();
  }

  // Getter method for menu bar score
  public int getFoodScore() {
    return foodEaten;
  }

  // When snake eats food, increment the count
  abstract public void incrementFoodCount();

  // Return shape list, not just a single coordinate
  public PVector getFoodLocation() {
    return this.gridLocation;
  }

  protected Object getMapGridObjectData(int x, int y) {
    return this.mapGridObjectData[x][y];
  }
}
