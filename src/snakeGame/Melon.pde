import java.util.ArrayList;

    public class Melon extends Food {
      
      public Melon(GameScreen game) {
        
            // Melon yellow
            super(game, new PVector(0, 0), color(255, 155, 0)); 
            
            // Four cell square
            // Bottom left cell is baseline location
            this.shape.add(new PVector(0, 0)); 
            this.shape.add(new PVector(1, 0));
            this.shape.add(new PVector(0, 1));
            this.shape.add(new PVector(1, 1));
            
            // Makes score zero at game start (melon gives you 1 point)
            this.foodEaten = -1; 
        }
        
        // Eating a melon gives you 1 point (large size fruit)
        public void incrementFoodCount(){
         this.foodEaten++; 
      }     
    }
