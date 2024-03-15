public class Snake extends AbstractSnake { 
  public Snake(GameScreen game, int len, int colour) {
     super(game, len, colour); 
  }
  
  
  protected PVector generateStartingPosition(GameScreen game, int len) {
    PVector startingPosition = new PVector();
    int bufferAbove = 10;
    int bufferSides = 10;

    int startX = Main.COLS / 2; // Starting X position close to the middle
    int startY = Main.ROWS / 2; // Starting Y position close to the middle

    // Find the starting position that satisfies the conditions
  outerloop:
    for (int y = startY + bufferAbove; y < Main.ROWS; y++) {
      for (int x = startX - bufferSides; x <= startX + bufferSides - len + 1; x++) {
        boolean empty = true;
        // Check if the cells are empty
        for (int i = 0; i < len; i++) {
          if (game.getMapGridObjectData(x + i, y) != null) {
            empty = false;
            break;
          }
        }
        if (empty) {
          startingPosition = new PVector(x, y);
          break outerloop;
        }
      }
    }

    return startingPosition;
  }

  // add colision detecion here:
  // Method to move the snake

  protected void move() {
    // Move the head of the snake based on velocity
    PVector headPosition = snakeCells.getLast().gridLocation.copy();
    headPosition.add(velocity);

    // Wrap around the screen if the head goes off the screen
    if (headPosition.x < 0) {
      headPosition.x = COLS - 1;  // Move to the right edge
    } else if (headPosition.x >= COLS) {
      headPosition.x = 0;          // Move to the left edge
    }
    if (headPosition.y < 0) {
      headPosition.y = ROWS - 1; // Move to the bottom edge
    } else if (headPosition.y >= ROWS) {
      headPosition.y = 0;          // Move to the top edge
    }

    // Collision detection with the grid
    int headX = (int) headPosition.x;
    int headY = (int) headPosition.y;

    Object gridObject = game.getMapGridObjectData(headX, headY);
    if (gridObject != null && gridObject instanceof Wall) {
      state = GameState.OVER;
      return;
    }

    // Create a new cell at the new head position and update snake
    SnakeCell newHead = new SnakeCell(headPosition, colour);
    snakeCells.removeFirst();
    snakeCells.addLast(newHead);
  }
  
    protected void setVelocity(float x, float y) {
    // Ensure the velocity is not reversed (snake can't turn 180 degrees instantly)
    if (x != -velocity.x || y != -velocity.y) {
      velocity.set(x, y);
    }
  }
}
