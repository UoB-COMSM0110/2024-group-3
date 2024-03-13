import java.util.LinkedList;
import processing.core.PVector;

public class Snake {
  private LinkedList<SnakeCell> snakeCells;
  private PVector velocity;
  private int colour;
  private GameScreen game;

  public Snake(GameScreen game, int len, int colour) {
    this.snakeCells = new LinkedList<>();
    this.velocity = new PVector(0, -1); // Initial velocity (upwards)
    this.colour = colour;
    this.game = game;

    PVector position = generateStartingPosition(game, len);
    for (int i = 0; i < len; i++) {
      snakeCells.add(new SnakeCell(position.copy(), colour));
      position.add(velocity); // Move to the next position based on velocity
    }
  }


  private PVector generateStartingPosition(GameScreen game, int len) {
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


  public void renderSnake() {
    for (SnakeCell cell : snakeCells) {
      cell.fillGridCell();
    }
  }

  // Method to add a cell to the end of the snake
  public void addCell(SnakeCell cell) {
    snakeCells.addLast(cell);
  }

  // Method to remove and return the first cell of the snake
  public SnakeCell removeFirst() {
    return snakeCells.removeFirst();
  }


  // add colision detecion here:
  // Method to move the snake

  public void move() {
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

  // Method to change the direction of the snake
  public void setVelocity(float x, float y) {
    // Ensure the velocity is not reversed (snake can't turn 180 degrees instantly)
    if (x != -velocity.x || y != -velocity.y) {
      velocity.set(x, y);
    }
  }

  // Method to grow the snake by adding a cell at its tail
  public void grow() {
    // Duplicate the last cell (tail) of the snake and add it to the end
    SnakeCell tail = snakeCells.getLast();
    snakeCells.addLast(new SnakeCell(tail.gridLocation.copy(), colour));
  }

  // Other methods to manipulate the snake, such as checking for collisions, etc.

  // Inner class SnakeCell
  private class SnakeCell extends GridCell {
    private SnakeCell(PVector gridLocation, int colour) {
      super(gridLocation, colour);
    }
  }
}
