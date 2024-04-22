import java.util.ArrayList;

public abstract class Food extends Consumable {
  int potentialRow;
  int potentialColumn;
  int foodEaten = 0;
  
  public Food(GameScreen game, PVector gridLocation, int colour) {
        super(game, gridLocation, colour); 
  }
  
  @Override
  public void renderConsumable() {
        for (PVector cell : this.shape) {
            float i = (this.gridLocation.x + cell.x) * CELL_SIZE; 
            float j = (this.gridLocation.y + cell.y) * CELL_SIZE; 
            fill(this.colour);  
            rect(i, j, CELL_SIZE, CELL_SIZE); 
        }
    }
  
  public void setRandomConsumableLocation() {
     int oldColumn = (int) this.gridLocation.x;
     int oldRow = (int) this.gridLocation.y;
     findGridLocation();
     setConsumableMapGridObjectData();
     clearConsumableMapGridObjectData(oldColumn, oldRow); 
     incrementFoodCount();
  }
  
  //getter method for menu bar score
  public int getFoodScore(){
     return foodEaten;
  }
  
  abstract public void incrementFoodCount();
  
  //return shape list, not just a single coordinate 
  public PVector getFoodLocation() {
    return this.gridLocation;
  }  
  
    //interaction between snake and food currently happens in Snake class. In the future, abstract interactions between objects out 
}
