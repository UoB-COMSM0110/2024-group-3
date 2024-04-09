import java.util.ArrayList;

abstract class Consumable extends GridCell {
  
  protected int colour;
  protected GameScreen game;

  public Consumable(GameScreen game, PVector gridLocation, int colour) {
    super(gridLocation, colour);
    this.game = game;
  }

  abstract void renderConsumable(); 

}

//to do: create Powerup class that inherits from this class
