package org.uob;

import java.awt.*;
import processing.core.*;

public abstract class GridCell  {

    private final int[] gridLocation;
    protected static final int cellSize = 15;

    private int colour;

    private final PApplet game;

    public GridCell(PApplet game, int[] gridLocation) {
        this.game = game;
        this.gridLocation = gridLocation;

    }

    public GridCell(PApplet game, int[] gridLocation, int colour) {
        this(game, gridLocation);
        this.colour = colour;
    }

    public int[] getGridLocation() {
        return gridLocation;
    }

    public int getColour() {
        return colour;
    }

    public void setColour(int colour) {
        this.colour = colour;
    }

    public PApplet getGame() {
        return this.game;
    }

}
