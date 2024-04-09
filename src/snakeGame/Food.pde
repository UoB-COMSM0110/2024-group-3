import java.util.ArrayList;

public abstract class Food extends Consumable {
  int potentialRow;
  int potentialColumn;
  int foodEaten = -1; //when food instantiated for the first time, will be incremented to 0
  
  public Food(GameScreen game, PVector gridLocation, int colour) {
        super(game, gridLocation, colour); 
        game.setMapGridObjectData((int) gridLocation.x, (int)gridLocation.y, this);
        this.colour = colour;
  }
  
  public void renderConsumable() {
      for (PVector cell : this.shape) {
        float i = (this.gridLocation.x + cell.x) * CELL_SIZE; 
        float j = (this.gridLocation.y + cell.y) * CELL_SIZE; 
        fill(this.colour);  
        rect(i, j, CELL_SIZE, CELL_SIZE); 
      }
   } 
  
  protected ArrayList<PVector> shape = new ArrayList<>();
  
  public void setRandomFoodLocation() {
     int oldColumn = (int) this.gridLocation.x;
     int oldRow = (int) this.gridLocation.y;
     findGridLocation();
     setFoodMapGridObjectData();
     clearFoodMapGridObjectData(oldColumn, oldRow); 
     this.foodEaten++;
  }
    
  private void findGridLocation() {
    for (PVector cell : this.shape) {
      while(this.game.getMapGridObjectData(potentialColumn + (int)cell.x, potentialRow + (int)cell.y) != null){
        this.potentialColumn = (int)(Math.random() * COLS); 
        this.potentialRow = (int)(Math.random() * ROWS); 
      }
    }
    this.gridLocation.x = this.potentialColumn; 
    this.gridLocation.y = this.potentialRow;  
  }
    
  private void setFoodMapGridObjectData(){
    for (PVector cell : this.shape) {
      this.game.setMapGridObjectData(new PVector(potentialColumn + (int)cell.x, potentialRow + (int)cell.y), this);  
    }
  }
    
  private void clearFoodMapGridObjectData(int oldColumn, int oldRow){
    for (PVector cell : this.shape) {
       this.game.setMapGridObjectData(new PVector(oldColumn + (int)cell.x, oldRow + (int)cell.y), null);  
    }
  }
  
  //getter method for menu bar score
  public int getFoodScore() {
     return this.foodEaten; 
  }
  
  //return shape list, not just a single coordinate 
  public PVector getFoodLocation() {
    return this.gridLocation;
  }  
  
    //interaction between snake and food currently happens in Snake class. In the future, abstract interactions between objects out 
}
