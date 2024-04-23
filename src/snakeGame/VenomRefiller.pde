public class VenomRefiller extends Powerup {
  
  public VenomRefiller(GameScreen game) {
        //unlike food, this powerup stars with a PVector of (1, 1) because the baseline location cell is in the middle
        super(game, new PVector(1, 1), color(200, 0, 200)); //venom purple 
        //plus shape, to look like a health powerup
        this.shape.add(new PVector(1, 1)); //centre
        this.shape.add(new PVector(1, 0)); //N
        this.shape.add(new PVector(2, 1)); //E
        this.shape.add(new PVector(1, 2)); //S
        this.shape.add(new PVector(0, 1)); //W
  }
  
  public void setRandomConsumableLocation() {
     //save the previous location of the powerup
     int oldColumn = (int) this.gridLocation.x;
     int oldRow = (int) this.gridLocation.y;
     findGridLocation(); //find a new location 
     setConsumableMapGridObjectData(); //add new powerup to grid metadata
     clearConsumableMapGridObjectData(oldColumn, oldRow); //remove powerup at previous location from grid metadata
  }
  
}
