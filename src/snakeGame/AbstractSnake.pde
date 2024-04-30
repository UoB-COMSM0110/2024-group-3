import java.util.LinkedList;
import processing.core.PVector;
    
    // An abstract class to define common properties for differnt types of Snakes
    abstract class AbstractSnake {
      protected LinkedList<SnakeCell> snakeCells;
      protected PVector velocity;
      protected int colour;
      protected GameScreen game;
      
      // Constructor which needs a gameScreen to render the snake on and colour
      public AbstractSnake(GameScreen game, int colour) {
        this.snakeCells = new LinkedList<>();
        this.velocity = new PVector(0, -1); 
        this.colour = colour;
        this.game = game;
      }
      
      // Loops through list of and renders each cell of snake
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
      
      // Getter method for list of snake cells
      public LinkedList<SnakeCell> getSnakeCells() {
        return this.snakeCells;
      }
      
      // Getter for velocity
      public PVector getVelocity() {
        return velocity;
      }
      
      // Abstract method which will implemented differently depending on type of snake
      protected abstract void move();
      
      // Setter for velocity
      protected abstract void setVelocity(float x, float y);
      
      // Used for collision detection in snake
      public boolean isPositionInSnake(PVector position) {
        for (SnakeCell cell : snakeCells) {
          if (cell.gridLocation.x == position.x && cell.gridLocation.y == position.y) {
            return true;
          }
        }
        return false;
      }
      
      // Cleans all snake objects from metadata when game ends
      public void cleanUp() {
        
        // Clear snake cells from the game grid
        for (SnakeCell cell : snakeCells) {
          game.setMapGridObjectData(cell.gridLocation, null);
        }
        snakeCells.clear();
      }
    }
