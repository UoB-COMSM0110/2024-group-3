import java.util.ArrayList;

public class Apple extends Food {
  public Apple(GameScreen game) {
        super(game, new PVector(0, 0), color(141, 182, 0));
        this.shape.add(new PVector(0, 0));
        this.foodEaten = -3; //to zero score at game start
  }
  
  public void incrementFoodCount(){
     this.foodEaten+=3; 
  }
  
  
 
}
