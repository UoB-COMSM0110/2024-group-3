import java.util.ArrayList;

public class Melon extends Food {
  
  public Melon(GameScreen game) {
        super(game, new PVector(0, 0), color(255, 155, 0));
        //four cell square
        this.shape.add(new PVector(0, 0));
        this.shape.add(new PVector(1, 0));
        this.shape.add(new PVector(0, 1));
        this.shape.add(new PVector(1, 1));
        this.foodEaten = -1; //to zero score at game start
    }
    
    public void incrementFoodCount(){
     this.foodEaten++; 
  }
}
