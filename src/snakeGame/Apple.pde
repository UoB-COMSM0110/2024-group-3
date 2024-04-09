import java.util.ArrayList;

public class Apple extends Food {
  public Apple(GameScreen game) {
        super(game, new PVector(0, 0), color(141, 182, 0));
        this.shape.add(new PVector(0, 0));
  }
 
}
