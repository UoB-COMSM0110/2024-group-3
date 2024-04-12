import java.util.ArrayList;

/*
 Spiky wall --> import png --> snake dies
 teleportation wall --> snake teleports to random part of map
 weak that you can through
 semi weak --> shoot venom to break a whole
 
 */

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
    // Only add the cell if it doesn't have any adjacent brick
    //if (hasAdjacentBrick(x, y)) {
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
