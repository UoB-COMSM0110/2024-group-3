import java.io.BufferedReader; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;
import java.awt.event.KeyEvent;


/*
 Game Screen which maps objects to a 2d grid for look up/collision detection:
 It has a setup function where anything that needs to be initialised at start of (e.g. walls) can be done.
 Other logic during game can be 'CALLED' in update.
 
 Grid is 45 rows by 100 cols where each cell has an index of (x, y) with the following mapping:
 (0,0) --> top left
 (99, 0) --> top right
 (44, 0) --> bottom left
 (99, 44) --> bottom right
 */


public class GameScreen {

  // Metadata of object on grid:
  // Private ArrayList<ArrayList<Object>> mapGridObjectData;
  private Object[][] mapGridObjectData;

  // Inanimate objects
  private ArrayList<Wall> walls;
  private Apple apple;
  private Banana banana;
  private Melon melon;

  // Two VenomRefiller powerups, because only having one makes it too hard
  private VenomRefiller venomRefillerOne;
  private VenomRefiller venomRefillerTwo;

  // Dynamic objects:
  private Snake snake;
  private ArrayList<EnemySnake> enemySnakes;
  private ArrayList<Venom> venom;
  private int startTime;
  private float snakeVenom = 300;
  private final int maxVenom = 300;
  private final int venomIncrementEasy = 30;
  private final int venomIncrementHard = 50;
  private int enemyScore = 0;
  private boolean play=false;
  private boolean acceptDirectionInput;
  private int startFrames = 0;


  public GameScreen() {
    this.walls = new ArrayList();
    this.mapGridObjectData = new Object[height][width];
    this.enemySnakes = new ArrayList<>();
    this.venom = new ArrayList<>();
    startTime=millis();
    this.apple = new Apple(this);
    this.banana = new Banana(this);
    this.melon = new Melon(this);
    this.startFrames = frameCount;
  }

  public void setup(String mapPath) {
    acceptDirectionInput = false;

    play=false;
    background(0, 0, 0);
    makeWalls(mapPath);
    snake = new Snake(this, 5, color(0, 190, 0));

    enemySnakes.add(new EnemySnake(this, 5, color(190, 0, 0)));

    // There's always one of each of the three types of food on the grid
    this.apple = new Apple(this);
    this.apple.setRandomConsumableLocation();

    // Assert that object at this location in metadata is an apple
    assert getMapGridObjectData((int) apple.gridLocation.x, (int)apple.gridLocation.y) instanceof Apple;
    this.banana = new Banana(this);
    this.banana.setRandomConsumableLocation();
    assert getMapGridObjectData((int) banana.gridLocation.x, (int)banana.gridLocation.y) instanceof Banana;
    this.melon = new Melon(this);
    this.melon.setRandomConsumableLocation();
    assert getMapGridObjectData((int) melon.gridLocation.x, (int)melon.gridLocation.y) instanceof Melon;
    this.venomRefillerOne = new VenomRefiller(this);
    this.venomRefillerOne.setRandomConsumableLocation();
    this.venomRefillerTwo = new VenomRefiller(this);
    this.venomRefillerTwo.setRandomConsumableLocation();
  }

  public void update() {

    // Accept key presses to update direction
    acceptDirectionInput = true;

    // Move all dynamic objects first before rendering:
    snake.move();

    int maxEnemyCount = 7;

    if (difficultyMode == 1) {
      maxEnemyCount = 12;
    }

    int gameFrames = frameCount - startFrames;

    if (enemySnakes.size() <= maxEnemyCount) {

      if (difficultyMode == 0) {

        // gameFrames modulus value can vary depending on difficulty level!
        if (gameFrames < 240) {
          if (gameFrames % 120 == 0) {
            enemySnakes.add(new EnemySnake(this, 5, color((int) random(100, 255), 0, 0)));
          }
        } else if (gameFrames >= 240 && gameFrames <= 480) {
          if (gameFrames % 100 == 0) {
            enemySnakes.add(new EnemySnake(this, 5, color((int) random(100, 255), 0, 0)));
          }
        } else if (gameFrames >= 480 && gameFrames <= 720) {
          if (gameFrames % 80 == 0) {
            enemySnakes.add(new EnemySnake(this, 5, color((int) random(100, 255), 0, 0)));
          }
        } else if (gameFrames >= 720 && gameFrames <= 960) {
          if (gameFrames % 60 == 0) {
            enemySnakes.add(new EnemySnake(this, 5, color((int) random(100, 255), 0, 0)));
          }
        } else if (gameFrames > 960) {
          if (gameFrames % 40 == 0) {
            enemySnakes.add(new EnemySnake(this, 5, color((int) random(100, 255), 0, 0)));
          }
        }
      } else {
        if (gameFrames <= 300) {
          if (gameFrames % 140 == 0) {
            enemySnakes.add(new EnemySnake(this, 5, color((int) random(100, 255), 0, 0)));
          }
        } else if (gameFrames > 300 && gameFrames <= 600) {
          if (gameFrames % 110 == 0) {
            enemySnakes.add(new EnemySnake(this, 5, color((int) random(100, 255), 0, 0)));
          }
        } else if (gameFrames > 600 && gameFrames <= 900) {
          if (gameFrames % 90 == 0) {
            enemySnakes.add(new EnemySnake(this, 5, color((int) random(100, 255), 0, 0)));
          }
        } else if (gameFrames > 900) {
          if (gameFrames % 70 == 0) {
            enemySnakes.add(new EnemySnake(this, 5, color((int) random(100, 255), 0, 0)));
          }
        }
      }
    }

    for (EnemySnake enemy : enemySnakes) {
      enemy.move();
    }
    for (Venom currVenom : venom.stream().toList()) {
      currVenom.move();
      if (!currVenom.isActive()) {
        venom.remove(currVenom);
      }
    }
    // Draw background:
    drawGameBoard();

    // Draw all objects:
    renderWalls();
    banana.renderConsumable();
    melon.renderConsumable();
    apple.renderConsumable();
    venomRefillerOne.renderConsumable();
    venomRefillerTwo.renderConsumable();
    snake.renderSnake();

    for (EnemySnake enemy : enemySnakes) {
      enemy.renderSnake();
    }
    for (Venom currVenom : venom) {
      currVenom.renderVenom();
    }
    int elapsedTime = millis() - startTime;
    int seconds = elapsedTime / 1000;
    int minutes = seconds / 60;
    seconds = seconds % 60;
    String timeString = nf(minutes, 2) + ":" + nf(seconds, 2);

    // Venom bar can't go below zero (even though it says max)
    snakeVenom = max(snakeVenom, 0);

    // Venom bar can't exceed maximum (even though it says min)
    snakeVenom  = min(snakeVenom, maxVenom);

    // Assert test venom bar stays in valid range
    assert snakeVenom >= 0 && snakeVenom <= 300;
    fill(255, 0, 0); //red

    windowResize(width, height+100);
    fill(150, 200, 150);
    rect(0, height, width, 100);

    fill(255);
    fill(0);
    text("Time: "+timeString, 200, height+50);

    // The score bar at the bottom of the screen displays how many shots of venom you have
    // Fallback message for when shots == 0
    String venomString = "Venom (empty: eat + powerup!)";
    float venomShots = 0;

    // Snake has 6 shots of venom in easy mode, depleted from 300 in increments of 50 (50*6 == 300)
    if (difficultyMode == 0) {

      // If there's a shot remaining, snake venom is in bounds and the venom has been reduced by an increment as expected
      if (snakeVenom >= venomIncrementEasy && snakeVenom <= maxVenom && snakeVenom % venomIncrementEasy == 0) {

        // Calculate remaining shots
        venomShots = snakeVenom / venomIncrementEasy;

        // Display number of current venom shots according to caluclation
        venomString = "Venom (" + (int)venomShots + "/10 shots)";
      }
    }

    // Snake has 10 shots of venom in hard mode, depleted from 300 in increments of 30 (30*10 == 300)
    else {

      // If there's a shot remaining, snake venom is in bounds and the venom has been reduced by an increment as expected
      if (snakeVenom >= venomIncrementHard && snakeVenom <= maxVenom && snakeVenom % venomIncrementHard == 0) {

        // Calculate remaining shots
        venomShots = snakeVenom / venomIncrementHard;

        // Display number of current venom shots according to caluclation
        venomString = "Venom (" + (int)venomShots + "/6 shots)";
      }
    }

    text(venomString, 600, height + 20);

    // Venom purple
    fill(200, 0, 200);
    rect(450, height+50, snakeVenom, 20);
    fill(255);
    fill(0);

    // Total score is sum of score for eating food plus score for killing enemy snakes
    totalScore = apple.getFoodScore() + banana.getFoodScore() + melon.getFoodScore() + enemyScore;
    text("Your score: "+totalScore, 1000, height+50);

    // Display high scores for easy and hard modes separtely
    // Easy mode
    if (difficultyMode==0) {
      text("High score: "+highScore.infor[0].score, 1000, height+20);

      // Hard mode
    } else {
      text("High score: "+highScore_hard.infor[0].score, 1000, height+20);
    }

    fill(255, 0, 0);
    if (totalScore>highScore.infor[0].score) {
      text("New", 1100, height+50);
      if (!play) {
        file_new.play();
        play=true;
      }
    }

    if (isShowTips==1) {
      textAlign(CENTER, CENTER);
      textSize(24);
      fill(255, 180);
      text("press ↑ ↓ ← → to move                press the space bar to fire venom", width/2, 10);
    }
  }

  //killing enemy snakes increases your score by 5
  public void incrementEnemyScore() {
    enemyScore+=5;
  }

  // Only allow one directional/arrow key press per frame
  public void handleKeyPress() {
    if (!acceptDirectionInput) {
      return;
    }
    acceptDirectionInput = false;

    if (keyCode == UP || key == 'w' || key == 'W') {

      // Move up
      snake.setVelocity(0, -1);
    } else if (keyCode == DOWN|| key == 's' || key == 'S') {

      // Move down
      snake.setVelocity(0, 1);
    } else if (keyCode == LEFT|| key == 'a' || key == 'A') {

      // Move left
      snake.setVelocity(-1, 0);
    } else if (keyCode == RIGHT|| key == 'd' || key == 'D') {

      // Move right
      snake.setVelocity(1, 0);
    } else if (keyCode == KeyEvent.VK_SPACE  && snakeVenom > 0) {

      // Instantiate a Venom using the snake's current velocity and position
      PVector snakePosition = snake.getSnakeCells().getLast().gridLocation.copy();
      PVector snakeVelocity = snake.getVelocity().copy();

      // If snake's position is too close to top or left border, don't create venom (otherwise whole game freezes)
      if (snakePosition.x <= 0 && snakeVelocity.x != 0 || snakePosition.y <= 0 && snakeVelocity.y != 0
        || snakePosition.y >= 44 && snakeVelocity.y != 0 || snakePosition.x >= 99 && snakeVelocity.x != 0) {
        return;
      }
      if (getMapGridObjectData(PVector.add(snakePosition, snakeVelocity)) instanceof Wall) {
        return;
      }

      // Set venom color (e.g., red)
      int venomColour = color(200, 0, 200);
      venom.add(new Venom(this, venomColour, snakePosition, snakeVelocity, snake));
      depleteVenomBar();
    } else if (keyCode==ESC) {
      key=0;
    }
  }

  // Getter and Setter for grid metadata. Used for updating location of game entities
  public void setMapGridObjectData(int x, int y, Object obj) {
    this.mapGridObjectData[x][y] = obj;
  }

  public void setMapGridObjectData(PVector location, Object obj) {
    this.mapGridObjectData[(int)location.x][(int)location.y] = obj;
  }

  public Object getMapGridObjectData(int x, int y) {
    return this.mapGridObjectData[x][y];
  }

  public Object getMapGridObjectData(PVector location) {
    return this.mapGridObjectData[(int)location.x][(int)location.y];
  }

  // Draw game play area
  private void drawGameBoard() {
    background(60);
    if (isShowTips2==1) {
      drawGridLines();
    }
  }

  private void drawGridLines() {
    stroke(100);
    for (int i = 0; i <= Main.COLS; i++) {
      float x = i * Main.CELL_SIZE;
      line(x, 0, x, height);
    }
    for (int j = 0; j <= Main.ROWS; j++) {
      float y = j * Main.CELL_SIZE;
      line(0, y, width, y);
    }
  }

  public void addWall(Wall wall) {
    walls.add(wall);
  }


  // Reads map csv file and generates wall objects given by the specified configuration
  private void makeWalls(String mapPath) {
    try {
      mapPath = sketchPath("../" + mapPath);
      BufferedReader reader = new BufferedReader(new FileReader(mapPath));
      ArrayList<ArrayList<String>> mapData = new ArrayList<>();

      // Read the CSV file and parse each line
      String line;
      while ((line = reader.readLine()) != null) {
        String[] tokens = line.split(",");
        ArrayList<String> row = new ArrayList<>();
        for (String token : tokens) {

          // Add trimmed tokens to the row list
          row.add(token.trim());
        }

        // Add the row to the map data
        mapData.add(row);
      }

      // Process the map data to create wall objects
      int wallCount = 0;
      for (int y = 0; y < mapData.size(); y++) {
        ArrayList<String> row = mapData.get(y);
        for (int x = 0; x < row.size(); x++) {
          String cell = row.get(x);
          if (cell.startsWith("w")) {

            // Cell belongs to a wall
            // Extract wall number
            int wallNumber = Integer.parseInt(cell.substring(1));
            if (wallNumber > wallCount) {
              wallCount = wallNumber;
            }
          }
        }
      }

      // Instantiate wall objects based on wall count
      for (int i = 1; i <= wallCount; i++) {
        Wall wall = new Wall(color(128, 128, 128));
        for (int y = 0; y < mapData.size(); y++) {
          ArrayList<String> row = mapData.get(y);
          for (int x = 0; x < row.size(); x++) {
            String cell = row.get(x);
            if (cell.equals("w" + i)) {

              // Add cell to the wall
              // Replace 0 with actual colour if needed
              wall.addWallCell(x, y);
              setMapGridObjectData(x, y, wall);
            }
          }
        }
        this.addWall(wall);
      }
      reader.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }

  // Add a method to render the walls
  public void renderWalls() {
    for (Wall wall : walls) {
      wall.renderWall();
    }
  }

  public ArrayList<PVector> getOccupiedPositionsByEnemies(EnemySnake currentEnemy) {
    ArrayList<PVector> occupiedPositions = new ArrayList<>();
    for (EnemySnake enemy : enemySnakes) {

      // Skip the current enemy snake to avoid checking against itself
      if (enemy != currentEnemy) {
        for (SnakeCell cell : enemy.getSnakeCells()) {
          occupiedPositions.add(cell.getGridLocation());
        }
      }
    }
    return occupiedPositions;
  }

  // Venom setters
  // Called when you consume a venom powerup
  public void refillVenomBar() {
    snakeVenom +=maxVenom;
  }

  // Venom bar depleted by different amounts depending on easy/hard mode
  public void depleteVenomBar() {
    if (difficultyMode == 0) {
      snakeVenom -=venomIncrementEasy;
    } else {
      snakeVenom -=venomIncrementHard;
    }
  }

  public void cleanUp() {

    // Clear walls
    walls.clear();

    // Clear consumables
    if (apple != null) {
      apple.cleanUp();
      apple = null;

      // Assert apple has been removed
      assert apple == null;
    }
    if (banana != null) {
      banana.cleanUp();
      banana = null;

      // Assert banana has been removed
      assert banana == null;
    }
    if (melon != null) {
      melon.cleanUp();
      melon = null;

      // Assert melon has been removed
      assert melon == null;
    }
    if (venomRefillerOne != null) {
      venomRefillerOne.cleanUp();
      venomRefillerOne = null;

      // Assert venom refiller has been removed
      assert venomRefillerOne == null;
    }
    if (venomRefillerTwo != null) {
      venomRefillerTwo.cleanUp();
      venomRefillerTwo = null;

      // Assert venom refiller has been removed
      assert venomRefillerTwo == null;
    }

    // Clear main snake
    if (snake != null) {
      snake.cleanUp();
      snake = null;
    }

    // Clear enemy snakes
    for (EnemySnake enemy : enemySnakes) {
      enemy.cleanUp();
    }
    enemySnakes.clear();

    // Reset map grid data
    mapGridObjectData = new Object[Main.ROWS][Main.COLS];
  }

  public void removeEnemySnake(EnemySnake snake) {
    for (SnakeCell cell : snake.getSnakeCells()) {

      // Clear each cell from grid
      setMapGridObjectData(cell.getGridLocation(), null);
    }

    // Remove snake from list
    enemySnakes.remove(snake);
  }
}
