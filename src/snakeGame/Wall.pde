import java.util.ArrayList;

public class Wall {

  // Declare an ArrayList of WallCell objects
  private ArrayList<WallCell> wallCells;
  private int colour;

  // Constructor which takes colour of wall
  public Wall(int colour) {
    this.wallCells = new ArrayList<>();
    this.colour = colour;
  }

  // Add wall cells 'bricks' to form wall object
  public void addWallCell(int x, int y) {
    this.wallCells.add(new WallCell(new PVector(x, y), colour));
  }

  // Removes specified wall cell from wall if in wall
  public void removeWallCell(PVector location) {
    for (WallCell cell : wallCells) {
      if (cell.getGridLocation().x == location.x && cell.getGridLocation().y == location.y) {
        wallCells.remove(cell);
        break;
      }
    }
  }

  // Render wall by iterating of array and filling each WallCell
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
