import java.util.ArrayList;

public class Food extends Consumable {
  
  public Food(GameScreen game, PVector gridLocation, int colour) {
        super(game, gridLocation, colour); 
        game.setMapGridObjectData((int) gridLocation.x, (int)gridLocation.y, this);
  }
  
  public void renderConsumable() {
      this.fillGridCell();
    }
    
    
    //this evening: merge Alex's develop branch changes in and resolve any conflicts 
    //tomorrow: generate new food object and update metadata for food and snake
    //get basic implementation of food working: in setup, food instantiated, food is rendered
    //in snake class, do interaction between snake and food (for now: in the future we'll abstract out the interaction)
    //then, make the Food class abstract, with a food type, and then specific instances that inherit from it e.g. apple, banana, with different colours and attribute for snake length delta 
}
