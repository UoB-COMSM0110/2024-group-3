abstract class Powerup extends Consumable {
  int baselineTime = 0;
  int intervalTime = 500; //0.5 seconds
  boolean isColour = false; 
  
  public Powerup(GameScreen game, PVector gridLocation, int colour) {
        super(game, gridLocation, colour); 
  }
  
  @Override
  public void renderConsumable() {
    flashIsColourBool();
    for (PVector cell : this.shape) {
      float i = (this.gridLocation.x + cell.x) * CELL_SIZE; 
      float j = (this.gridLocation.y + cell.y) * CELL_SIZE; 
      if (isColour) {
        fill(this.colour);
      } else {
        fill(255);
      }
      rect(i, j, CELL_SIZE, CELL_SIZE);
    }
  }
    
  private void flashIsColourBool(){
    if (millis() - baselineTime > intervalTime) {
      isColour = !isColour;
      baselineTime = millis(); 
    }
  }
  
}
