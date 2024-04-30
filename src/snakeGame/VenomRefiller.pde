public class VenomRefiller extends Powerup {
  
    public VenomRefiller(GameScreen game) {
      
        // Unlike food, this powerup stars with a PVector of (1, 1) because the baseline location cell is in the middle
        // Venom purple
        super(game, new PVector(1, 1), color(200, 0, 200));  
        
        // Plus shape, to look like a health powerup
        // Centre
        this.shape.add(new PVector(1, 1)); 
        
        // N
        this.shape.add(new PVector(1, 0)); 
        
        // E
        this.shape.add(new PVector(2, 1)); 
        
        // S
        this.shape.add(new PVector(1, 2)); 
        
        // W
        this.shape.add(new PVector(0, 1)); 
    }
  
    public void setRandomConsumableLocation() {
      
      // Save the previous location of the powerup
      int oldColumn = (int) this.gridLocation.x;
      int oldRow = (int) this.gridLocation.y;
      
      // Find a new location
      findGridLocation();  
      
      // Add new powerup to grid metadata
      setConsumableMapGridObjectData(); 
      
      // Remove powerup at previous location from grid metadata
      clearConsumableMapGridObjectData(oldColumn, oldRow); 
    }
  
  }
