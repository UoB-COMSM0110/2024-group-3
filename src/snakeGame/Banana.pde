import java.util.ArrayList;

public class Banana extends Food {
  public Banana(GameScreen game) {
        super(game, new PVector(0, 0), color(255,225,53));
        //two cell shape
        this.shape.add(new PVector(0, 0));
        this.shape.add(new PVector(1, 0));
  }
}
