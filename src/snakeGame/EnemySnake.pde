import java.util.Random;
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
        boolean validPositionFound = false;
        int startX = 0;
        int startY = 0;
        int buffer = 5;

        while (!validPositionFound) {
            startX = rand.nextInt(Main.COLS - 2 * buffer) + buffer;
            startY = rand.nextInt(Main.ROWS - 2 * buffer) + buffer;
            boolean empty = true;

            for (int i = 0; i < len; i++) {
                int x = (startX + i) % Main.COLS;
                PVector testPosition = new PVector(x, startY);
                Object gridObject = game.getMapGridObjectData(x, startY);
                
             if (gridObject != null ||
                PVector.dist(testPosition, playerHead) < 18) {
                empty = false;
                break;
            }
                
  /*                                          
                if (game.getMapGridObjectData(x, startY) != null ||
                    PVector.dist(testPosition, playerHead) < 18 ||
                    gridObject instanceof Wall ||
                    gridObject instanceof EnemySnake ||
                    gridObject instanceof Food ||
                    gridObject instanceof Consumable) {
                    empty = false;
                    break;
                }
                */
            }            

            if (empty) {
                validPositionFound = true;
            }
        }

        return new PVector(startX, startY);
    }
  
    @Override
    protected void move() {
        if (frameCount % 2 == 0) return;
        if (snakeCells.isEmpty()) return;

        ArrayList<PVector> occupiedPositionsByEnemies = game.getOccupiedPositionsByEnemies(this);
        PVector headPosition = snakeCells.getFirst().gridLocation;
        float minDistance = Float.MAX_VALUE;
        PVector bestMove = null;

        int[][] directions = {{0, -1}, {1, 0}, {0, 1}, {-1, 0}, {0, 0}}; // Up, Right, Down, Left, Stay

        for (int[] dir : directions) {
            PVector testPosition = new PVector(headPosition.x + dir[0], headPosition.y + dir[1]);

            if (game.snake.isPositionInSnake(testPosition)) {
                gameState = GameState.OVER;
                return;
            }

            if (!(game.getMapGridObjectData((int)testPosition.x, (int)testPosition.y) instanceof Wall) &&
                !isPositionInSnake(testPosition) &&
                !occupiedPositionsByEnemies.contains(testPosition)) {
                float distance = PVector.dist(testPosition, game.snake.getSnakeCells().getLast().gridLocation);
                if (distance < minDistance) {
                    minDistance = distance;
                    bestMove = testPosition;
                }
            }
        }

        if (bestMove != null) {
            velocity.set(bestMove.x - headPosition.x, bestMove.y - headPosition.y);

            if (velocity.x == 0 && velocity.y == 0) {
                return; // If the best move is to stay, do not update the snake's position
            }

            PVector newHeadPosition = headPosition.copy().add(velocity);
            game.setMapGridObjectData(snakeCells.getLast().gridLocation, null); // Clear old tail position from grid
            snakeCells.removeLast();
            snakeCells.addFirst(new SnakeCell(newHeadPosition, this.colour));
            game.setMapGridObjectData(newHeadPosition, this); // Update new head position in grid
        }
    }

    @Override
    protected void setVelocity(float x, float y) {
        velocity.set(x, y);
    }
}
