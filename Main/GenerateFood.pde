//Food driver class

//create eat food method to mock up collision with snake head (for now, pressing E key = eat?)

//when food is eaten, destroy food cell and create another food cell in a random location

class GenerateFood {

private PApplet game; 
int row;
int column; 

    public GenerateFood(PApplet game) {
        this.game = game;
        float row_float = random(0,45); //replace with height
        float column_float = random(0,90); //replace with width
        this.row = int(row_float);
        this.column = int(column_float);
    }

public void displayFood() {
        ArrayList<FoodCell> food = new ArrayList<>();
        food.add(new FoodCell(game, new int[]{column,row}, "apple"));
    }
}
