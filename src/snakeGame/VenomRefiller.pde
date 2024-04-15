public class VenomRefiller extends Powerup {
  
  public VenomRefiller(GameScreen game) {
        super(game, new PVector(1, 1), color(200, 0, 200));
        //plus shape
        this.shape.add(new PVector(1, 1)); //centre
        this.shape.add(new PVector(1, 0)); //N
        this.shape.add(new PVector(2, 1)); //E
        this.shape.add(new PVector(1, 2)); //S
        this.shape.add(new PVector(0, 1)); //W
  }
  
  public void setRandomConsumableLocation() {
     int oldColumn = (int) this.gridLocation.x;
     int oldRow = (int) this.gridLocation.y;
     findGridLocation();
     setConsumableMapGridObjectData();
     clearConsumableMapGridObjectData(oldColumn, oldRow); 
  }
  
}
