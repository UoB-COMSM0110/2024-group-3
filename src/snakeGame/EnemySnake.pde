public class EnemySnake extends AbstractSnake {
   
  public EnemySnake(GameScreen game, int len, int colour) {
    super(game, len, colour); 
    PVector position = generateStartingPosition(game, len);
  
    for (int i = 0; i < len; i++) {
      snakeCells.add(new SnakeCell(position.copy(), colour));
      position.add(velocity);
    }
  }

  protected PVector generateStartingPosition(GameScreen game, int len) {
    Random rand = new Random(System.currentTimeMillis());
    PVector playerHead = game.snake.getSnakeCells().getLast().gridLocation;
    boolean validPositionFound = false;
    int startX = 0;
    int startY = 0;
    int buffer = 5;

    while (!validPositionFound) {
      startX = rand.nextInt(Main.COLS - 2 * buffer) + buffer;
      startY = rand.nextInt(Main.ROWS - 2 * buffer) + buffer;
      boolean empty = true;
      
      // Checks for empty cells, far enough from player's snake  
      for (int i = 0; i < len; i++) {
        int x = (startX + i) % Main.COLS;
        if (game.getMapGridObjectData(x, startY) != null) {
          empty = false;
          break;
        }
        // Check distance from player snake's head
        PVector testPosition = new PVector(x, startY);
        
        if (PVector.dist(testPosition, playerHead) < 18) {
          empty = false;
          break;
        }
      }
      
      if (empty) {
        validPositionFound = true;
      }
    }

    return new PVector(startX, startY);  
  }
  
  protected void move() {
    if (frameCount % 2 == 0) {
      return;
    }
  
    ArrayList<PVector> occupiedPositionsByEnemies = game.getOccupiedPositionsByEnemies(this);
  
    if (snakeCells.isEmpty()) {
      return;
    }
  
    PVector headPosition = snakeCells.getFirst().gridLocation;
    float minDistance = Float.MAX_VALUE;
    PVector bestMove = headPosition.copy(); //Think this could be anything!

    int[][] directions = {{0, -1}, {1, 0}, {0, 1}, {-1, 0}}; // U, D, L, R
  
    for (int[] dir : directions) {
      PVector testPosition = new PVector(headPosition.x + dir[0], headPosition.y + dir[1]);
      
      if (game.snake.isPositionInSnake(testPosition)) {
        state = GameState.OVER;
      }

      if (!(game.getMapGridObjectData((int)testPosition.x, (int)testPosition.y) instanceof Wall) 
          && !isPositionInSnake(testPosition)
          && !occupiedPositionsByEnemies.contains(testPosition)) {
            float distance = PVector.dist(testPosition, game.snake.getSnakeCells().getLast().gridLocation);
        
            if (distance < minDistance) {
              minDistance = distance;
              bestMove.set(testPosition);
            }
      }
    }

    velocity.set(bestMove.x - headPosition.x, bestMove.y - headPosition.y);
    PVector newHeadPosition = headPosition.copy().add(velocity);
    snakeCells.addFirst(new SnakeCell(newHeadPosition, this.colour));
    snakeCells.removeLast();
}

  protected void setVelocity(float x, float y) {
    velocity.set(x, y);
  }
}
