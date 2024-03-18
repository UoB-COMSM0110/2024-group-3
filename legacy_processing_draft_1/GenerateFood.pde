//to do: ensure food doensn't spawn on wallcells, snake or enemy
//for MVP, assume there is only one type of food (apple) that adds one unit length to the snake when eaten
//types of food and a getter method for snake length increase are handled in the FoodCell class 
//this class has a public getFoodLocation method, which the snake class can use to check for collision with food
//on collision, the public updateFoodLocation method should be called. This will remove the "eaten" food and generate new food in a random location
//the menu bar code can call the getFoodScore public method to display amount of food eaten, if needed

class DriveFood {

private PApplet game; 
int row;
int column; 
int[] location = {row, column};
int foodEaten;

    public DriveFood(PApplet game) {
        this.game = game;
        this.location = new int[2]; 
        setRandomFoodLocation();
    }
    
    public void updateFoodLocation() {
        setRandomFoodLocation();
        this.foodEaten++;
        //print("Food eaten ": + this.foodEaten);
    }
    
    private void setRandomFoodLocation() {
        float row_float = random(0,45); //replace magic number ("height" doesn't work)
        float column_float = random(0,90); //replace magic number ("width" doesn't work)
        this.row = int(row_float);
        this.column = int(column_float);
        this.location[0] = this.row;
        this.location[1] = this.column; 
    }

    private void displayFood() {
        ArrayList<FoodCell> food = new ArrayList<>();
        food.add(new FoodCell(game, new int[]{column,row}, "apple")); //only apple for MVP, implement other types later
    }
    
    public int[] getFoodLocation() {
      return this.location;
    }   
    
    public int getFoodScore() {
      return this.foodEaten;
    }   
}
