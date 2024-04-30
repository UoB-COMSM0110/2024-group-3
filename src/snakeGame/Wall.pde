import java.util.ArrayList;
  
  public class Wall {
    
    // Declare an ArrayList of WallCell objects
    private ArrayList<WallCell> wallCells;
    private int colour;
  
    // Constructor
    public Wall(int colour) {
      this.wallCells = new ArrayList<>();
      this.colour = colour;
    }
    
    public void addWallCell(int x, int y) {
      this.wallCells.add(new WallCell(new PVector(x, y), colour));
    }
    
    public void removeWallCell(PVector location) {
      for (WallCell cell : wallCells) {
        if (cell.getGridLocation().x == location.x && cell.getGridLocation().y == location.y) {
          wallCells.remove(cell);
          break;
        }
      }
    }
    
    public void renderWall() {
      for (WallCell cell : wallCells) {
        cell.fillGridCell();
      }
    }
    
    // Inner class WallCell
    private class WallCell extends GridCell {
      private WallCell(PVector gridLocation, int colour) {
        super(gridLocation, colour);
      }
    }  
  }
