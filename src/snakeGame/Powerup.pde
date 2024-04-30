abstract class Powerup extends Consumable {
  int baselineTime = 0;

  // 0.5 seconds
  int intervalTime = 500;
  boolean isColour = false;

  // Powerups flash to differentiate powerups from food
  public Powerup(GameScreen game, PVector gridLocation, int colour) {
    super(game, gridLocation, colour);
  }

  // Powerups are rendered differently than food because powerups flash
  @Override
  public void renderConsumable() {

    // Oscillate isColour boolean between true and false
    flashIsColourBool();
    for (PVector cell : this.shape) {
      float i = (this.gridLocation.x + cell.x) * CELL_SIZE;
      float j = (this.gridLocation.y + cell.y) * CELL_SIZE;
      if (isColour) {
  
        // Colour defined in concrete implementation of powerup i.e. VenomRefiller
        fill(this.colour);
      } else {
  
        // When it's not this colour, it's white
        fill(255);
      }
      rect(i, j, CELL_SIZE, CELL_SIZE);
    }
  }

  private void flashIsColourBool() {

    // Millis is number of milliseconds since starting sketch
    // If e.g. more than 0.5 seconds has passed
    if (millis() - baselineTime > intervalTime) {

      // Flip the boolean
      isColour = !isColour;

      // Reset the baseline time to time elapsed
      baselineTime = millis();
    }
  }
}
