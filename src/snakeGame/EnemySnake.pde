/*
- Ensure snakes don't spawn on top of eachother
- If enemy snakes can't move, just make them stay still until they can move
*/

public class EnemySnake extends AbstractSnake {
   
  public EnemySnake(GameScreen game, int len, int colour) {
    super(game, colour); 
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
        ArrayList<PVector> occupiedPositionsByEnemies = game.getOccupiedPositionsByEnemies(this);
        boolean empty = true;

        for (int i = 0; i < len; i++) {
            int x = (startX + i) % Main.COLS;
            PVector testPosition = new PVector(x, startY);

            if (game.getMapGridObjectData(x, startY) != null || 
                PVector.dist(testPosition, playerHead) < 18 || 
                occupiedPositionsByEnemies.contains(testPosition)) {
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
    // DON'T CHECK FOR -1! ARRAY OUT OF BOUNDS INDEX
    // Can change vary depending on difficulty level!
    if (frameCount % 2 == 0) {
      return;
    }
      
    if (snakeCells.isEmpty()) {
      return;
    }
  
    ArrayList<PVector> occupiedPositionsByEnemies = game.getOccupiedPositionsByEnemies(this);  
    PVector headPosition = snakeCells.getFirst().gridLocation;
    float minDistance = Float.MAX_VALUE;
    PVector bestMove = headPosition.copy(); //Think this could be anything!

    int[][] directions = {{0, -1}, {1, 0}, {0, 1}, {-1, 0}, {0, 0}}; // U, D, L, R
  
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
    
    if (velocity.x == 0 && velocity.y == 0) {
      return;
    }
    
    PVector newHeadPosition = headPosition.copy().add(velocity);
    snakeCells.addFirst(new SnakeCell(newHeadPosition, this.colour));
    snakeCells.removeLast();
}

  protected void setVelocity(float x, float y) {
    velocity.set(x, y);
  }
}
