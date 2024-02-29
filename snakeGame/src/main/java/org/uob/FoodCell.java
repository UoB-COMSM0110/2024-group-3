package org.uob;

import java.awt.*;
import java.util.Objects;

import processing.core.*;


class FoodCell extends GridCell {

    int colour = getColour();
    private String foodType;

    public FoodCell(PApplet game, int[] gridLocation, String foodType, int colour) {
        super(game, gridLocation);
        this.foodType = foodType;
        if(Objects.equals(foodType, "apple")){
            colour = game.color(141, 182, 0);
        }
        else if(Objects.equals(foodType, "cherry")){
            colour = game.color(255, 87, 51);
        }
        else if(Objects.equals(foodType, "banana")){
            colour = game.color(255,225,53);
        }
        fillFoodCell(game, gridLocation, colour);
    }
    private void fillFoodCell(PApplet game, int[] gridLocation, int colour) {
        float i = gridLocation[0] * GridCell.cellSize;
        float j = gridLocation[1] * GridCell.cellSize;
        game.fill(colour);
        game.rect(i, j, GridCell.cellSize, GridCell.cellSize);
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