import java.util.ArrayList;

public class Banana extends Food {
  public Banana(GameScreen game) {
        super(game, new PVector(0, 0), color(255,225,53)); //banana green 
        //two cell shape
        this.shape.add(new PVector(0, 0));
        this.shape.add(new PVector(1, 0));
        this.foodEaten = -2; //to zero score at game start (banana gives you two points)
  }
  
  //Eating a banana gives you 2 points (medium size fruit)
  public void incrementFoodCount(){
     this.foodEaten+=2; 
  }
 
}
