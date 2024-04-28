import java.util.ArrayList;

    //An abstract class to define common properties across food and powerups 
    abstract class Consumable extends GridCell {
      protected int colour;
      protected GameScreen game;
      protected ArrayList<PVector> shape = new ArrayList<>(); //consumables are arraylists of PVectors
      protected Object[][] mapGridObjectData; //for assert testing
      //start by randomly choosing some potential rows and columns, before checking if they're free
      int potentialRow;
      int potentialColumn;
      static final int boundsOffset = 2; //prevents consumables spawning off the edge of the grid
    
      public Consumable(GameScreen game, PVector gridLocation, int colour) {
        super(gridLocation, colour);
        this.game = game;
        //add central PVector to grid metadata
        game.setMapGridObjectData((int) gridLocation.x, (int)gridLocation.y, this);
        this.colour = colour;
      }
    
      //draw the consumable onscreen
      abstract void renderConsumable();
    
      abstract public void setRandomConsumableLocation();
    
      protected void findGridLocation() {
        boolean validLocationFound; //this boolean helps keep the method short
        //while there's no valid location for the consumable, keep looking
        do {
            validLocationFound = true; //default boolean to true
            //subtract double the bounds offset to offset the offset
            this.potentialColumn = boundsOffset + (int)(Math.random() * (COLS - boundsOffset * 2)); //keep away from edges of grid
            this.potentialRow = boundsOffset + (int)(Math.random() * (ROWS - boundsOffset * 2));
            validLocationFound = isWholeShapeValid(); //if whole shape is valid, exit loop. Otherwise, keep searching
            
        } while (!validLocationFound);
        this.gridLocation.x = this.potentialColumn;
        this.gridLocation.y = this.potentialRow;
    }
    
      //helper method to ensure that every cell of the consumable doesn't overlap with other objects (not just the central cell)
      protected boolean isWholeShapeValid() {
        for (PVector cell : this.shape) {
            int checkColumn = potentialColumn + (int)cell.x;
            int checkRow = potentialRow + (int)cell.y;
            //bounds checking
            boolean outOfBounds = checkColumn >= COLS || checkRow >= ROWS || checkColumn < boundsOffset || checkRow < boundsOffset; 
            boolean isOccupied = this.game.getMapGridObjectData(checkColumn, checkRow) != null;
            if (outOfBounds || isOccupied) {
                return false; 
            }        
        }
        return true;
    }
    
    
      //add all GridCells of the consumable to the grid metadata
      protected void setConsumableMapGridObjectData() {
        for (PVector cell : this.shape) {
          this.game.setMapGridObjectData(new PVector(potentialColumn + (int)cell.x, potentialRow + (int)cell.y), this);
        }
      }
    
      //when the consumable is consumed, remove it from the grid metadata
      protected void clearConsumableMapGridObjectData(int oldColumn, int oldRow) {
        for (PVector cell : this.shape) {
          this.game.setMapGridObjectData(new PVector(oldColumn + (int)cell.x, oldRow + (int)cell.y), null);
        }
      }
    
      public void cleanUp() {
        // Clear the map grid data associated with this consumable
        clearConsumableMapGridObjectData((int) gridLocation.x, (int) gridLocation.y);
      }
    }
