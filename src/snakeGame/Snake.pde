import java.util.Iterator;

// Concrete implementation of Abstract Snake that the Player will control
public class Snake extends AbstractSnake {

  public Snake(GameScreen game, int len, int colour) {
    super(game, colour);

    // Find valid starting position for snake
    PVector position = findEmptyRectangle(game, 15, 1, 5);
    for (int i = 0; i < len; i++) {
      snakeCells.add(new SnakeCell(position.copy(), colour));

      // Move to the next position based on velocity
      position.add(velocity);
    }

    // Update map gripobjectData
    for (SnakeCell cell : snakeCells) {
      game.setMapGridObjectData((int) cell.gridLocation.x, (int) cell.gridLocation.y, this);
    }
  }

  private PVector findEmptyRectangle(GameScreen game, int rows, int cols, int len) {
    PVector middlePoint = new PVector();
    rows = 2*rows + len;
    cols = 2*cols;

    // Iterate over the grid to find a rectangle of empty cells
    for (int y = 0; y <= Main.ROWS - rows; y++) {
      for (int x = 0; x <= Main.COLS - cols; x++) {
        boolean isEmptyRectangle = true;

        // Check if the cells in the rectangle are empty
        for (int rowOffset = 0; rowOffset < rows; rowOffset++) {
          for (int colOffset = 0; colOffset < cols; colOffset++) {
            int checkX = x + colOffset;
            int checkY = y + rowOffset;

            // Ensure the check indices stay within the valid range
            if (checkX >= 0 && checkX < Main.COLS && checkY >= 0 && checkY < Main.ROWS &&
              game.getMapGridObjectData(checkX, checkY) != null) {
              isEmptyRectangle = false;

              // Break out of the inner loop if not empty
              break;
            }
          }
          if (!isEmptyRectangle) {

            // Break out of the outer loop if not empty
            break;
          }
        }

        // If an empty rectangle is found, calculate the middle point and return
        if (isEmptyRectangle) {

          // Calculate the middle point based on the dimensions of the empty rectangle
          int middleX = x + cols / 2;
          int middleY = y + rows / 2;
          middlePoint.set(middleX, middleY);
          return middlePoint;
        }
      }
    }

    // Return (0, 0) if no empty rectangle is found
    return middlePoint;
  }

  // To tell snake about interaction between venom and food
  private boolean hasVenomHitFood = false;

  // This method is called in the Venom class
  public void venomHitFood() {
    hasVenomHitFood = true;
  }

  protected void move() {

    // Move the head of the snake based on velocity
    PVector headPosition = snakeCells.getLast().gridLocation.copy();
    headPosition.add(velocity);

    // Wrap around the screen if the head goes off the screen
    if (headPosition.x < 0) {

      // Move to the right edge
      headPosition.x = COLS - 1;
    } else if (headPosition.x >= COLS) {

      // Move to the left edge
      headPosition.x = 0;
    }
    if (headPosition.y < 0) {

      // Move to the bottom edge
      headPosition.y = ROWS - 1;
    } else if (headPosition.y >= ROWS) {

      // Move to the top edge
      headPosition.y = 0;
    }

    Object gridObject = game.getMapGridObjectData(headPosition);
    if (gridObject instanceof Wall || gridObject instanceof Snake && !isSnakeCellWithinFirstThree(headPosition)) {
      gameState = GameState.OVER;
      return;
    }
    SnakeCell newHead = new SnakeCell(headPosition, colour);
    snakeCells.add(newHead);
    game.setMapGridObjectData(headPosition, this);

    if (gridObject instanceof Food ) {

      // When snake eats food, move the food
      ((Food) gridObject).setRandomConsumableLocation();

      // Add new head but dont remove tail: snake grows when it eats
      return;
    }
    if (hasVenomHitFood == true) {

      // Reset boolean for next time
      hasVenomHitFood = false;

      // Return early to add new head but not remove tail: snake grows when it eats (via venom)
      return;
    }

    if (gridObject instanceof Powerup) {

      // Move the powerup
      ((Powerup) gridObject).setRandomConsumableLocation();

      // Replenish venom
      game.refillVenomBar();
    }

    // Remove tail cell:
    SnakeCell removedCell = snakeCells.removeFirst();
    game.setMapGridObjectData(removedCell.gridLocation, null);
  }

  protected void setVelocity(float x, float y) {

    // Ensure the velocity is not reversed (snake can't turn 180 degrees instantly)
    if (x != -velocity.x || y != -velocity.y) {
      velocity.set(x, y);
    }
  }

  private boolean isSnakeCellWithinFirstThree(PVector position) {
    int count = 0;
    Iterator<SnakeCell> iterator = snakeCells.descendingIterator();
    while (iterator.hasNext() && count < 3) {
      SnakeCell cell = iterator.next();
      if (position.equals(cell.gridLocation)) {
        return true;
      }
      count++;
    }
    return false;
  }
}
