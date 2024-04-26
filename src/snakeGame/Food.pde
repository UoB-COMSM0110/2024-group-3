import java.util.ArrayList;

    public abstract class Food extends Consumable {
      int potentialRow;
      int potentialColumn;
      int foodEaten = 0; //at game start, no food is eaten
      
      public Food(GameScreen game, PVector gridLocation, int colour) {
            super(game, gridLocation, colour); 
      }
      
      @Override
      public void renderConsumable() {
            for (PVector cell : this.shape) {
                //offset gridLocation with cell location
                float i = (this.gridLocation.x + cell.x) * CELL_SIZE; 
                float j = (this.gridLocation.y + cell.y) * CELL_SIZE; 
                fill(this.colour);  //each concrete implementation of this class has its own colour
                rect(i, j, CELL_SIZE, CELL_SIZE); //create a square the size of a GridCell
            }
      }
      
      public void setRandomConsumableLocation() {
         int oldColumn = (int) this.gridLocation.x;
         int oldRow = (int) this.gridLocation.y;
         findGridLocation();
         //add food to grid metadata
         setConsumableMapGridObjectData();
         //when food is eaten, clear it from metadata
         clearConsumableMapGridObjectData(oldColumn, oldRow); 
         //keep track of food score for UI display 
         incrementFoodCount();
      }
      
      //getter method for menu bar score
      public int getFoodScore(){
         return foodEaten;
      }
      
      //when snake eats food, increment the count 
      abstract public void incrementFoodCount();
      
      //return shape list, not just a single coordinate 
      public PVector getFoodLocation() {
        return this.gridLocation;
      }  
      
    }
