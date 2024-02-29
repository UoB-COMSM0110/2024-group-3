package org.uob;

import processing.core.PApplet;

class WallCell extends GridCell {
    public WallCell(PApplet game, int[] gridLocation, int colour) {
        super(game, gridLocation, colour);
        fillWallCell(game, gridLocation, colour);

    }
    private void fillWallCell(PApplet game, int[] gridLocation, int colour) {
        float i = gridLocation[0] * GridCell.cellSize;
        float j = gridLocation[1] * GridCell.cellSize;
        game.fill(colour);
        game.rect(i, j, GridCell.cellSize, GridCell.cellSize);
    }
}


