import java.util.ArrayList;

public class Food extends Consumable {
  int potentialRow;
  int potentialColumn;
  int foodEaten = -1; //when food instantiated for the first time, will be incremented to 0
  
  public Food(GameScreen game, PVector gridLocation, int colour) {
        super(game, gridLocation, colour); 
        game.setMapGridObjectData((int) gridLocation.x, (int)gridLocation.y, this);
  }
  
  public void renderConsumable() {
      this.fillGridCell();
    }
    
  private void getPotentialRandomFoodLocation() {
      potentialColumn = (int)random(0,COLS-1); 
      potentialRow = (int)random(0,ROWS-1); 
  }
  
  public void setRandomFoodLocation() {
    while(this.game.getMapGridObjectData(this.potentialColumn, this.potentialRow) != null){
       getPotentialRandomFoodLocation();
    }
    this.gridLocation.x = this.potentialColumn;
    this.gridLocation.y = this.potentialRow;
    this.game.setMapGridObjectData(this.gridLocation, this); 
    this.foodEaten++;
  }
  
  //getter method for menu bar score
  public int getFoodScore() {
     return this.foodEaten; 
  }
  
  public PVector getFoodLocation() {
    return this.gridLocation;
  }  
  
    //interaction between snake and food currently happens in Snake class. In the future, abstract interactions between objects out 
    //to do: make the Food class abstract, with a food type, and then specific instances that inherit from it e.g. apple, banana, with different colours and attribute for snake length delta 
}
