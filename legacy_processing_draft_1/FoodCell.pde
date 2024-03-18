class FoodCell extends GridCell {

    private int colour;
    private String foodType;

    public FoodCell(PApplet game, int[] gridLocation, String foodType) {
        super(game, gridLocation);
        this.foodType = foodType;
        int colour = 0;
        if (foodType.equals("apple")) {
            colour = game.color(141, 182, 0);
        } 
        else if (foodType.equals("cherry")) {
            colour = game.color(255, 0, 0);
        } 
        else if (foodType.equals("banana")) {
            colour = game.color(255, 225, 53);
        }
        
        fillGridCell(game, gridLocation, colour);
    }

    public int getSnakeLengthIncrease() {
        if (foodType.equals("apple")) {
            return 1;
        } 
        else if (foodType.equals("cherry")) {
            return 2;
        } 
        else if (foodType.equals("banana")) {
            return 3;
        }
        return -1;
    }
}
