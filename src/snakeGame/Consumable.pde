import java.util.ArrayList;

    // An abstract class to define common properties across food and powerups 
    abstract class Consumable extends GridCell {
      protected int colour;
      protected GameScreen game;
      
      // Consumables are arraylists of PVectors
      protected ArrayList<PVector> shape = new ArrayList<>(); 
      
      // For assert testing
      protected Object[][] mapGridObjectData;
      
      // Start by randomly choosing some potential rows and columns, before checking if they're free
      int potentialRow;
      int potentialColumn;
      
      // Prevents consumables spawning off the edge of the grid
      static final int boundsOffset = 2;
    
      public Consumable(GameScreen game, PVector gridLocation, int colour) {
        super(gridLocation, colour);
        this.game = game;
        
        // Add central PVector to grid metadata
        game.setMapGridObjectData((int) gridLocation.x, (int)gridLocation.y, this);
        this.colour = colour;
      }
    
      // Draw the consumable onscreen
      abstract void renderConsumable();
    
      abstract public void setRandomConsumableLocation();
    
      protected void findGridLocation() {
        
        // This boolean helps keep the method short
        boolean validLocationFound;
        
        // While there's no valid location for the consumable, keep looking
        do {
          
            // Default boolean to true
            validLocationFound = true; 
            
            // Subtract double the bounds offset to offset the offset
            // Keep away from edges of grid
            this.potentialColumn = boundsOffset + (int)(Math.random() * (COLS - boundsOffset * 2));
            this.potentialRow = boundsOffset + (int)(Math.random() * (ROWS - boundsOffset * 2));
            
            // If whole shape is valid, exit loop. Otherwise, keep searching
            validLocationFound = isWholeShapeValid(); 
            
        } while (!validLocationFound);
        this.gridLocation.x = this.potentialColumn;
        this.gridLocation.y = this.potentialRow;
    }
    
      // Helper method to ensure that every cell of the consumable doesn't overlap with other objects (not just the central cell)
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
    
    
      // Add all GridCells of the consumable to the grid metadata
      protected void setConsumableMapGridObjectData() {
        for (PVector cell : this.shape) {
          this.game.setMapGridObjectData(new PVector(potentialColumn + (int)cell.x, potentialRow + (int)cell.y), this);
        }
      }
    
      // When the consumable is consumed, remove it from the grid metadata
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
