import java.util.LinkedList; //<>// //<>// //<>//
import processing.core.PVector;

public class Snake {
  private LinkedList<SnakeCell> snakeCells;
  private PVector velocity;
  private int colour;
  private GameScreen game;
  private Food food;

  public Snake(GameScreen game, int len, int colour) {
    this.snakeCells = new LinkedList<>();
    this.velocity = new PVector(0, -1); // Initial velocity (upwards)
    this.colour = colour;
    this.game = game;

    PVector position = findEmptyRectangle(game, 15, 1, 5);
    System.out.println(position);
    for (int i = 0; i < len; i++) {
      snakeCells.add(new SnakeCell(position.copy(), colour));
      position.add(velocity); // Move to the next position based on velocity
    }

    // update map gripobjectData
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
                        break; // Break out of the inner loop if not empty
                    }
                }
                if (!isEmptyRectangle) {
                    break; // Break out of the outer loop if not empty
                }
            }
            // If an empty rectangle is found, calculate the middle point and return
            if (isEmptyRectangle) {
                // Calculate the middle point based on the dimensions of the empty rectangle
                int middleX = x + cols / 2;
                int middleY = y + rows / 2;
                middlePoint.set(middleX, middleY);
                System.out.println(middlePoint);
                return middlePoint;
            }
        }
    }

    return middlePoint; // Return (0, 0) if no empty rectangle is found
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

    Object gridObject = game.getMapGridObjectData(headPosition);
    if (gridObject instanceof Wall || gridObject instanceof Snake) {
      state = GameState.OVER;
      return;
    }
    SnakeCell newHead = new SnakeCell(headPosition, colour);
    snakeCells.add(newHead);
    game.setMapGridObjectData(headPosition, this);

    if (gridObject instanceof Food) {
      // add new head but dont remove tail:
      return;
    }

    // remove tail cell:
    SnakeCell removedCell = snakeCells.removeFirst();
    game.setMapGridObjectData(removedCell.gridLocation, null);
  }

  // Method to change the direction of the snake
  public void setVelocity(float x, float y) {
    // Ensure the velocity is not reversed (snake can't turn 180 degrees instantly)
    if (x != -velocity.x || y != -velocity.y) {
      velocity.set(x, y);
    }
  }

  private class SnakeCell extends GridCell {
    private SnakeCell(PVector gridLocation, int colour) {
      super(gridLocation, colour);
    }
  }
}
