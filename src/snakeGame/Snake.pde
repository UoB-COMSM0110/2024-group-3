import java.util.Iterator;

    public class Snake extends AbstractSnake {
      public Snake(GameScreen game, int len, int colour) {
        super(game, colour);
    
        PVector position = findEmptyRectangle(game, 15, 1, 5);
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
              return middlePoint;
            }
          }
        }
    
        return middlePoint; // Return (0, 0) if no empty rectangle is found
      }
    
      // add colision detecion here:
      // Method to move the snake
    
      private boolean hasVenomHitFood = false; //to tell snake about interaction between venom and food
    
      //this method is called in the Venom class
      public void venomHitFood() {
        hasVenomHitFood = true;
      }
    
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
    
        Object gridObject = game.getMapGridObjectData(headPosition);
        if (gridObject instanceof Wall || gridObject instanceof Snake && !isSnakeCellWithinFirstThree(headPosition)) {
          gameState = GameState.OVER;
          return;
        }
        SnakeCell newHead = new SnakeCell(headPosition, colour);
        snakeCells.add(newHead);
        game.setMapGridObjectData(headPosition, this);
    
        if (gridObject instanceof Food ) {
          //when snake eats food, move the food
          ((Food) gridObject).setRandomConsumableLocation();
          // add new head but dont remove tail: snake grows when it eats
          return;
        }
        if (hasVenomHitFood == true) {
          hasVenomHitFood = false; //reset boolean for next time
          return; // return early to add new head but not remove tail: snake grows when it eats (via venom)
        }
    
        if (gridObject instanceof Powerup) {
          ((Powerup) gridObject).setRandomConsumableLocation(); //move the powerup
          game.refillVenomBar(); //replenish venom
          // add new head and remove tail: snake doesn't grow
        }
    
        // remove tail cell:
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
