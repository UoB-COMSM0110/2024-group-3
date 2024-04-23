import java.util.ArrayList;

public class Apple extends Food {
  public Apple(GameScreen game) {
        super(game, new PVector(0, 0), color(141, 182, 0)); //apple green
        this.shape.add(new PVector(0, 0)); //apple is a single GridCell
        this.foodEaten = -3; //to zero score at game start (apple gives you 3 points)
  }
  
  //Eating an apple gives you 3 points (smallest size fruit)
  public void incrementFoodCount(){
     this.foodEaten+=3; 
  }
  
  
 
}
