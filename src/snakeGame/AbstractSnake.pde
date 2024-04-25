import java.util.LinkedList;
import processing.core.PVector;

    abstract class AbstractSnake {
      protected LinkedList<SnakeCell> snakeCells;
      protected PVector velocity;
      protected int colour;
      protected GameScreen game;
    
      public AbstractSnake(GameScreen game, int colour) {
        this.snakeCells = new LinkedList<>();
        this.velocity = new PVector(0, -1); 
        this.colour = colour;
        this.game = game;
      }
    
      public void renderSnake() {
        for (SnakeCell cell : snakeCells) {
          cell.fillGridCell();
        }
      }
    
      // Add cell to end of snake
      public void addCell(SnakeCell cell) {
        snakeCells.addLast(cell);
      }
    
      // Remove and return the first cell of the snake
      public SnakeCell removeFirst() {
        return snakeCells.removeFirst();
      }
    
      public LinkedList<SnakeCell> getSnakeCells() {
        return this.snakeCells;
      }
    
      public PVector getVelocity() {
        return velocity;
      }
    
      protected abstract void move();
    
      protected abstract void setVelocity(float x, float y);
    
      public boolean isPositionInSnake(PVector position) {
        for (SnakeCell cell : snakeCells) {
          if (cell.gridLocation.x == position.x && cell.gridLocation.y == position.y) {
            return true;
          }
        }
        return false;
      }
    
      public void cleanUp() {
        // Clear snake cells from the game grid
        for (SnakeCell cell : snakeCells) {
          game.setMapGridObjectData(cell.gridLocation, null);
        }
        snakeCells.clear();
      }
    }
