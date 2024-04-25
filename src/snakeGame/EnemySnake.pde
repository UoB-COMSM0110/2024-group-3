import java.util.Random;
import java.util.List;
import java.util.ArrayList;
import processing.core.PVector;
    
    
    public class EnemySnake extends AbstractSnake {
    
      public EnemySnake(GameScreen game, int len, int colour) {
        super(game, colour);
        PVector position = generateStartingPosition(game, len);
        for (int i = 0; i < len; i++) {
          snakeCells.add(new SnakeCell(position.copy(), colour));
          game.setMapGridObjectData(position, this);
          position.add(velocity);
          }
      }
    
      protected PVector generateStartingPosition(GameScreen game, int len) {
        Random rand = new Random(System.currentTimeMillis());
        PVector playerHead = game.snake.getSnakeCells().getLast().gridLocation;
        PVector playerTail = game.snake.getSnakeCells().getFirst().gridLocation;
        int positionsAttempted = 0;
        int maxAttempts = 20;
        int startX = 0;
        int startY = 0;
        int buffer = 6;
    
        while (positionsAttempted < maxAttempts) {
          startX = rand.nextInt(Main.COLS - 2 * buffer) + buffer;
          startY = rand.nextInt(Main.ROWS - 2 * buffer) + buffer;
          boolean isValid = true;
    
          for (int i = 0; i < len; i++) {
            int y = (startY - i) % Main.ROWS;
            PVector testPosition = new PVector(startX, y);
            Object gridObject = game.getMapGridObjectData(startX, y);
                    
              if (gridObject != null || PVector.dist(testPosition, playerHead) < 18 || PVector.dist(testPosition, playerTail) < 18) {
                isValid = false;
                break;
                }
                }            
    
              if (isValid) {
                return new PVector(startX, startY);
                }
                
            positionsAttempted++;
            }

        return null;
    }
    
      
    @Override
    protected void move() {
      if (difficultyMode == 0) {
        if (!(frameCount % 3 == 0)) return;
      }
      else {
        if (frameCount % 2 == 0) return;
      }
      
        if (snakeCells.isEmpty()) return;
    
            ArrayList<PVector> occupiedPositionsByEnemies = game.getOccupiedPositionsByEnemies(this);
            PVector headPosition = snakeCells.getFirst().gridLocation;
            float minDistance = Float.MAX_VALUE;
            PVector bestMove = null;
    
            int[][] directions = {{0, -1}, {1, 0}, {0, 1}, {-1, 0}}; // Up, Right, Down, Left, Stay
    
            for (int[] dir : directions) {
              
                PVector testPosition = new PVector(headPosition.x + dir[0], headPosition.y + dir[1]);
    
                if (game.snake.isPositionInSnake(testPosition)) {
                    gameState = GameState.OVER;
                    return;
                }
              
                if (headPosition.x + dir[0] < 1 || headPosition.x + dir[0] > Main.COLS - 1 || headPosition.y + dir[1] < 1 || headPosition.y + dir[1] > Main.ROWS - 1) {
                  continue;
                }
                
                Object gridObject = game.getMapGridObjectData((int)testPosition.x, (int)testPosition.y);
    
                if (!(gridObject instanceof Wall) &&
                    !(gridObject instanceof Food) &&
                    !(gridObject instanceof Consumable) &&
                    !isPositionInSnake(testPosition) &&
                    !occupiedPositionsByEnemies.contains(testPosition)) {
                    float distance = calculateClosestDistance(testPosition, game.snake.getSnakeCells());
                    if (distance < minDistance) {
                        minDistance = distance;
                        bestMove = testPosition;
                    }
                  }
               }
            
            if (bestMove == null) {
              for (int[] dir : directions) {
                PVector testPosition = new PVector(headPosition.x + dir[0], headPosition.y + dir[1]);
                
                Object gridObject = game.getMapGridObjectData((int)testPosition.x, (int)testPosition.y);
    
                if (gridObject instanceof Consumable) {
                    float distance = calculateClosestDistance(testPosition, game.snake.getSnakeCells());
                    if (distance < minDistance) {
                        minDistance = distance;
                        bestMove = testPosition;
                     }
                  }
               }
            }
          
    
          if (bestMove == null) {
              for (int[] dir : directions) {
                PVector testPosition = new PVector(headPosition.x + dir[0], headPosition.y + dir[1]);
                
                Object gridObject = game.getMapGridObjectData((int)testPosition.x, (int)testPosition.y);
    
                if (gridObject instanceof EnemySnake) {
                    float distance = calculateClosestDistance(testPosition, game.snake.getSnakeCells());
                    if (distance < minDistance) {
                        minDistance = distance;
                        bestMove = testPosition;
                        }
                }
             }
          }
        
            if (bestMove != null) {
                velocity.set(bestMove.x - headPosition.x, bestMove.y - headPosition.y);
    
                PVector newHeadPosition = headPosition.copy().add(velocity);
                game.setMapGridObjectData(snakeCells.getLast().gridLocation, null); // Clear old tail position from grid
                snakeCells.removeLast();
                snakeCells.addFirst(new SnakeCell(newHeadPosition, this.colour));
                game.setMapGridObjectData(newHeadPosition, this); // Update new head position in grid
            }        
        }
        
      // Helper method to calculate the closest distance from a test position to any cell in the player snake
        private float calculateClosestDistance(PVector testPosition, LinkedList<SnakeCell> playerCells) {
          float minDistance = Float.MAX_VALUE;
            for (SnakeCell cell : playerCells) {
              float distance = PVector.dist(testPosition, cell.getGridLocation());
              if (distance < minDistance) {
                minDistance = distance;
                }
            }
        return minDistance;
        }
    
     @Override
       protected void setVelocity(float x, float y) {
         velocity.set(x, y);
       }
       
       
    }
