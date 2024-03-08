package org.uob.boards;

import org.uob.boards.GridCell;
import processing.core.PApplet;

class WallCell extends GridCell {
    public WallCell(PApplet game, int[] gridLocation, int colour) {
        super(game, gridLocation, colour);
        fillGridCell(game, gridLocation, colour);

    }

}
