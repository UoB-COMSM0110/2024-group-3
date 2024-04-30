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

  // Searches for valid starting positions. Attempts this 20 times before giving up.
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

        // Assertion testing
        assert startX >= 1 && startX <= 100;
        assert startY >= 1 && startY <= 45;
        return new PVector(startX, startY);
      }

      positionsAttempted++;
    }

    return null;
  }


  // Scans each possible cell for the Enemy Snake to move to. Prioritises empty cells, then consumable cells, then Enemy Snake cells
  @Override
    protected void move() {
    if (difficultyMode == 0) {
      if (!(frameCount % 3 == 0)) return;
    } else {
      if (frameCount % 2 == 0) return;
    }

    if (snakeCells.isEmpty()) return;

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

      // Checks for an empty cell
      if (!(gridObject instanceof Wall) &&
        !(gridObject instanceof Food) &&
        !(gridObject instanceof Consumable) &&
        !(gridObject instanceof EnemySnake)) {
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

        // Checks for a consumable cell
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

        // Checks for an enemy snake cell
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

      // Assertion testing
      assert bestMove != null;
      assert bestMove.x >= 1 && bestMove.x <= 100;
      assert bestMove.y >= 1 && bestMove.y <= 45;
      assert minDistance >= 0;

      velocity.set(bestMove.x - headPosition.x, bestMove.y - headPosition.y);
      PVector newHeadPosition = headPosition.copy().add(velocity);
      game.setMapGridObjectData(snakeCells.getLast().gridLocation, null);
      snakeCells.removeLast();
      snakeCells.addFirst(new SnakeCell(newHeadPosition, this.colour));
      game.setMapGridObjectData(newHeadPosition, this);
    }
  }

  // Calculates the distance from the enemy snake head to the closest player snake cell
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

    // Assertion testing
    assert (x == -1 || x == 0 || x == 1);
    assert (y == -1 || y == 0 || y == 1);
    if (x == -1 || x == 1) {
      assert y == 0;
    }
    if (y == -1 || y == 1) {
      assert x == 0;
    }
  }
}
