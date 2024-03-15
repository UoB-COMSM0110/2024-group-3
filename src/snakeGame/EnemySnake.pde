 public class EnemySnake extends AbstractSnake {
   
     public EnemySnake(GameScreen game, int len, int colour) {
     super(game, len, colour); 
  }
  
protected PVector generateStartingPosition(GameScreen game, int len) {
    Random rand = new Random(System.currentTimeMillis());
    PVector playerHead = game.snake.getSnakeCells().getLast().gridLocation; // Assuming there's a method to get the player's head position

    boolean validPositionFound = false;
    int startX = 0;
    int startY = 0;

    while (!validPositionFound) {
        // Generate random start positions
        startX = rand.nextInt(Main.COLS);
        startY = rand.nextInt(Main.ROWS);

        boolean empty = true;
        // Check if the cells are empty and far enough from the player snake
        for (int i = 0; i < len; i++) {
            int x = (startX + i) % Main.COLS; // Ensure it wraps around if necessary
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
    if (snakeCells.isEmpty()) return;
    PVector headPosition = snakeCells.getFirst().gridLocation; // Assume the head is the first element.
    float minDistance = Float.MAX_VALUE;
    PVector bestMove = headPosition.copy(); // Initialize with the current head position for safety.

    int[][] directions = {{0, -1}, {1, 0}, {0, 1}, {-1, 0}}; // Up, Right, Down, Left
    for (int[] dir : directions) {
        PVector testPosition = new PVector(headPosition.x + dir[0], headPosition.y + dir[1]);
        
         if (game.snake.isPositionInSnake(testPosition)) {
        state = GameState.OVER; // End the game
        return; // Stop further execution
    }
        
        // Ensure testPosition wraps around the screen edges
        if (testPosition.x < 0) testPosition.x = Main.COLS - 1;
        else if (testPosition.x >= Main.COLS) testPosition.x = 0;
        if (testPosition.y < 0) testPosition.y = Main.ROWS - 1;
        else if (testPosition.y >= Main.ROWS) testPosition.y = 0;
        
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

    // Adjust velocity based on best move
    velocity.set(bestMove.x - headPosition.x, bestMove.y - headPosition.y);
    
    // Handle wrap-around for velocity directly applied to headPosition
    if (bestMove.x < 0) velocity.x = 1; // Moving left at left edge
    else if (bestMove.x >= Main.COLS) velocity.x = -1; // Moving right at right edge
    if (bestMove.y < 0) velocity.y = 1; // Moving up at top edge
    else if (bestMove.y >= Main.ROWS) velocity.y = -1; // Moving down at bottom edge

    // Now, move the snake by adding a new head in the direction of the best move
    PVector newHeadPosition = headPosition.copy().add(velocity);
    snakeCells.addFirst(new SnakeCell(newHeadPosition, this.colour)); // Add new head based on velocity
    snakeCells.removeLast(); // Remove the tail to simulate movement
}

protected void setVelocity(float x, float y) {
    velocity.set(x, y);
}
}
