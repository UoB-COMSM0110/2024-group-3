package org.uob.boards;

import java.util.Objects;

import processing.core.*;


public class FoodCell extends GridCell {

    int colour = getColour();
    private String foodType;

    public FoodCell(PApplet game, int[] gridLocation, String foodType) {
        super(game, gridLocation);
        this.foodType = foodType;
        int colour = 0;
        if(Objects.equals(foodType, "apple")){
            colour = game.color(141, 182, 0);
        }
        else if(Objects.equals(foodType, "cherry")){
            colour = game.color(255, 0, 0);
        }
        else if(Objects.equals(foodType, "banana")){
            colour = game.color(255,225,53);
        }
        fillGridCell(game, gridLocation, colour);
    }

    public int getSnakeLengthIncrease() {
        if (Objects.equals(foodType, "apple")){
            return 1;
        }
        else if (Objects.equals(foodType, "cherry")){
            return 2;
        }
        else if (Objects.equals(foodType, "banana")){
            return 3;
        }
        return -1;
    }
}
