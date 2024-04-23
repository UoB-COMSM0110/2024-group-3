abstract class Powerup extends Consumable {
  int baselineTime = 0;
  int intervalTime = 500; //0.5 seconds
  boolean isColour = false; 
  //to differentiate powerups from food, powerups flash
  
  public Powerup(GameScreen game, PVector gridLocation, int colour) {
        super(game, gridLocation, colour); 
  }
  
  @Override //powerups are rendered differently than food because powerups flash 
  public void renderConsumable() {
    flashIsColourBool(); //oscillate isColour boolean between true and false 
    for (PVector cell : this.shape) {
      float i = (this.gridLocation.x + cell.x) * CELL_SIZE; 
      float j = (this.gridLocation.y + cell.y) * CELL_SIZE; 
      if (isColour) {
        fill(this.colour); //colour defined in concrete implementation of powerup i.e. VenomRefiller
      } else {
        fill(255); //when it's not this colour, it's white
      }
      rect(i, j, CELL_SIZE, CELL_SIZE);
    }
  }
    
  private void flashIsColourBool(){
    //millis is number of milliseconds since starting sketch 
    if (millis() - baselineTime > intervalTime) { //if e.g. more than 0.5 seconds has passed
      isColour = !isColour; //flip the boolean
      baselineTime = millis(); //reset the baseline time to time elapsed
    }
  }
  
}
