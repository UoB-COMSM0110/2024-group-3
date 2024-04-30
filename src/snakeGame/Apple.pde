import java.util.ArrayList;

    public class Apple extends Food {
      public Apple(GameScreen game) {
        
            // Apple green colour
            super(game, new PVector(0, 0), color(141, 182, 0));
            
            // Apple is a single GridCell
            this.shape.add(new PVector(0, 0));
            
            // Makes score zero at game start (apple gives you 3 points)
            this.foodEaten = -3;
      }
      
      // Eating an apple gives you 3 points (smallest size fruit)
      public void incrementFoodCount(){
         this.foodEaten+=3; 
      }
    }
