import java.util.ArrayList;
import processing.core.PVector;

public class Venom {
  private ArrayList<VenomCell> venomCells;
  private PVector velocity;
  private int colour;
  private boolean active;
  private GameScreen game;

  public Venom(GameScreen game, int colour, PVector startPosition, PVector velocity) {
    PVector originalVelocity = velocity.copy();
    this.game = game;
    this.colour = colour;
    this.velocity = velocity.copy().mult(2);
    this.venomCells = new ArrayList<>();
    this.active = true;

    // Initialize the venom cells with two cells at the specified start position
    venomCells.add(new VenomCell(startPosition.copy(), colour));
    PVector nextPosition = startPosition.copy().add(originalVelocity);
    venomCells.add(new VenomCell(nextPosition, colour));

    // Update the game grid with the initial venom cells
    updateGridData();
  }

  public void renderVenom() {
    for (VenomCell cell : venomCells) {
      cell.fillGridCell();
    }
  }




  public void move() {
    // if collision or out of bounds near, reduce velocity to 1 cell per frame to improve visuals:
    if (!isPositionWithinGrid(PVector.add(venomCells.get(0).gridLocation.copy(), velocity)) ||
      !isPositionWithinGrid(PVector.add(venomCells.get(1).gridLocation.copy(), velocity)) ||
      hasCollisionAt(PVector.add(venomCells.get(0).gridLocation.copy(), velocity)) ||
      hasCollisionAt(PVector.add(venomCells.get(1).gridLocation.copy(), velocity))) {
      this.velocity = this.velocity.normalize();
    }

    // Calculate the movement step based on the normalized velocity
    PVector step = velocity.copy();

    // Create a new list for the updated venom cells
    ArrayList<VenomCell> newVenomCells = new ArrayList<>();

    // Get the current head position and calculate the new head position
    VenomCell currentHead = venomCells.get(0);
    PVector newHeadPosition = PVector.add(currentHead.gridLocation, step);
    if (!isPositionWithinGrid(newHeadPosition)) {
      newHeadPosition = null;
    }

    // Check collision at the new head position
    if (newHeadPosition != null && hasCollisionAt(newHeadPosition)) {
      active = false;
      handleCollision(newHeadPosition); // Handle collision at the new head position
    }

    // Check collision at the position behind the head (if available)
    if (active && venomCells.size() > 1) {
      VenomCell cellBehindHead = venomCells.get(1);
      PVector positionBehindHead = PVector.add(cellBehindHead.gridLocation, step);
      if (!isPositionWithinGrid(positionBehindHead)) {
        active = false;
      }
      if (active && hasCollisionAt(positionBehindHead)) {
        active = false;
        handleCollision(positionBehindHead); // Handle collision behind the head
      }
    }

    if (!active) {
      // Venom becomes inactive, remove from the game
      for (VenomCell cell : venomCells) {
        game.setMapGridObjectData(cell.gridLocation, null);
      }
      venomCells.clear(); // Clear the venom cells list
      updateGridData();   // Update the game grid
      return;
    }

    // Update the positions for all venom cells based on velocity
    for (VenomCell cell : venomCells) {
      // Calculate the new position for the cell
      PVector nextPosition = PVector.add(cell.gridLocation, step);

      // Add the new position to the updated venom cells list
      newVenomCells.add(new VenomCell(nextPosition, colour));
    }

    // Update the venom cells with the new positions
    venomCells = newVenomCells;

    // Update the game grid with the new venom positions
    updateGridData();
  }

  // Method to handle collision at a specific position
  private void handleCollision(PVector position) {
    Object gridObject = game.getMapGridObjectData(position);

    if (gridObject instanceof Wall) {
      // todo maybe make hole in wall:
    }

    if (gridObject instanceof Food) {
      consumeFood((Food) gridObject);
    }

    if (gridObject instanceof Powerup) {
      consumePowerup((Powerup) gridObject);
    }
  }

  // Method to consume food at a specific position
  private void consumeFood(Food food) {
    food.setRandomConsumableLocation();
  }

  // Method to consume powerup at a specific position
  private void consumePowerup(Powerup powerup) {
    powerup.setRandomConsumableLocation();
    game.incrementEnergy();
  }


  // Helper method to check if a position has collision with wall, enemy snake, or consumable
  private boolean hasCollisionAt(PVector position) {
    Object gridObject = game.getMapGridObjectData(position);
    return (gridObject instanceof Wall || gridObject instanceof EnemySnake || gridObject instanceof Consumable);
  }

  public boolean isActive() {
    return this.active;
  }

  // Helper method to check if a position is within the game grid
  private boolean isPositionWithinGrid(PVector position) {
    int x = (int) position.x;
    int y = (int) position.y;
    return x >= 0 && x < Main.COLS && y >= 0 && y < Main.ROWS;
  }

  // Update the game grid with the current positions of the venom cells
  private void updateGridData() {
    for (VenomCell cell : venomCells) {
      game.setMapGridObjectData(cell.gridLocation, this);
    }
  }

  // Inner class representing a cell of the venom
  private class VenomCell extends GridCell {
    public VenomCell(PVector gridLocation, int colour) {
      super(gridLocation, colour);
    }
  }
}
