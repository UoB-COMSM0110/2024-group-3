package org.uob;

import java.awt.*;
import java.util.Objects;

import processing.core.*;


class FoodCell extends GridCell {

    int colour = getColour();
    private String foodType;

    public FoodCell(PApplet game, int[] gridLocation, String foodType, int colour) {
        super(game, gridLocation, colour);
        this.foodType = foodType;
        fillFoodCell(game, gridLocation, colour);
    }
    private void fillFoodCell(PApplet game, int[] gridLocation, int colour) {
        float i = gridLocation[0] * GridCell.cellSize;
        float j = gridLocation[1] * GridCell.cellSize;
        game.fill(colour);
        game.rect(i, j, GridCell.cellSize, GridCell.cellSize);
    }

    public int getLengthIncrease() {
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