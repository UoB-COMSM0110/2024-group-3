import java.io.BufferedReader; //<>// //<>// //<>// //<>// //<>// //<>// //<>//
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;
import java.awt.event.KeyEvent;

/*
 Game Screen which maps objects to a 2d grid for look up/collision detection:
 It has a setup function where anything that needs to be initialised at start of (e.g. walls) can be done.
 Other logic during game can be 'CALLED' in update.
 
 Grid is 45 rows by 100 cols where each cell has an index of (x, y) with the following mapping:#
 (0,0) --> top left
 (99, 0) --> top right
 (44, 0) --> bottom left
 (99, 44) --> bottom right
 
 
 */


public class GameScreen {

  // metadata of object on grid:
  //private ArrayList<ArrayList<Object>> mapGridObjectData;
  private Object[][] mapGridObjectData;

  //inanimate objects
  private ArrayList<Wall> walls;
  private Apple apple;
  private Banana banana;
  private Melon melon;
  private VenomRefiller venomRefillerOne;
  private VenomRefiller venomRefillerTwo;

  //dynamic objects:
  private Snake snake;
  private ArrayList<EnemySnake> enemySnakes;
  private ArrayList<Venom> venom;
  private int startTime;
  private float snakeVenom = 300;
  private final int maxVenom = 300;
  private final int venomIncrement = 50;
  private int enemyScore = 0;


  public GameScreen() {
    this.walls = new ArrayList();
    this.mapGridObjectData = new Object[height][width];
    this.enemySnakes = new ArrayList<>();
    this.venom = new ArrayList<>();
    startTime=millis();
    this.apple = new Apple(this);
    this.banana = new Banana(this);
    this.melon = new Melon(this);
  }
  public void setup(String mapPath) {
    //drawGameBoard();
    background(0, 0, 0);
    makeWalls(mapPath);
    //renderWalls();
    snake = new Snake(this, 5, color(0, 190, 0));
    //snake.renderSnake();
    enemySnakes.add(new EnemySnake(this, 5, color(190, 0, 0)));
    //for (EnemySnake enemy : enemySnakes) {
    //  enemy.renderSnake();
    //}
    this.apple = new Apple(this);
    this.apple.setRandomConsumableLocation();
    this.banana = new Banana(this);
    this.banana.setRandomConsumableLocation();
    this.melon = new Melon(this);
    this.melon.setRandomConsumableLocation();
    this.venomRefillerOne = new VenomRefiller(this);
    this.venomRefillerOne.setRandomConsumableLocation();
    this.venomRefillerTwo = new VenomRefiller(this);
    this.venomRefillerTwo.setRandomConsumableLocation();
  }

  public void update() {
    // move all dynamic objects first before rendering:
    snake.move();

    // frameCount value can vary depending on difficulty level!
      if (frameCount <= 450) {
        if (frameCount % 140 == 0) {
          enemySnakes.add(new EnemySnake(this, 5, color((int) random(100, 255), 0, 0)));
        }
      }
      if (frameCount > 450 && frameCount <= 825) {
        if (frameCount % 120 == 0) {
          enemySnakes.add(new EnemySnake(this, 5, color((int) random(100, 255), 0, 0)));
        }
      } 
      if (frameCount > 825 && frameCount <= 1125) {
        if (frameCount % 100 == 0) {
          enemySnakes.add(new EnemySnake(this, 5, color((int) random(100, 255), 0, 0)));
        }
      } 
      if (frameCount > 1125) {
        if (frameCount % 60 == 0) {
          enemySnakes.add(new EnemySnake(this, 5, color((int) random(100, 255), 0, 0)));
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

    // draw background:
    drawGameBoard();

    // draw all objects:
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
    

    snakeVenom = max(snakeVenom , 0);
    snakeVenom  = min(snakeVenom , maxVenom);
    fill(255, 0, 0);

    windowResize(width, height+100);
    fill(255);

    text("Time: "+timeString, 200, height+50);
    //track bullets in UI
    String venomString = "Venom (empty: eat + powerup!)";  // fallback message
    if (snakeVenom >= venomIncrement && snakeVenom <= maxVenom && snakeVenom % venomIncrement == 0) {
       float venomBullets = snakeVenom / venomIncrement;
       venomString = "Venom (" + (int)venomBullets + "/6 shots)";
    }
    text(venomString, 600, height + 20); 
    fill(200, 0, 200);
    rect(450, height+50, snakeVenom , 20);
    fill(255);
    totalScore = apple.getFoodScore() + banana.getFoodScore() + melon.getFoodScore() + enemyScore;
    text("Your score: "+totalScore, 1000, height+50);
    if(difficultyMode==0){
      text("High score: "+highScore.infor[0].score, 1000, height+20);
    }else{
      text("High score: "+highScore_hard.infor[0].score, 1000, height+20);
    }
    
    fill(255,0,0);
    if(totalScore>highScore.infor[0].score){
       text("New", 1100, height+50);
    }
    
    if (isShowTips==1) {
      textAlign(CENTER,CENTER);
      textSize(24);
      fill(255,180);
      text("press ↑ ↓ ← → to move                press the space bar to fire venom",width/2,10);
    }
  }
  
  public void incrementEnemyScore(){
     enemyScore+=5; 
  }

  public void handleKeyPress() {
    if (keyCode == UP) {
      snake.setVelocity(0, -1); // Move up
    } else if (keyCode == DOWN) {
      snake.setVelocity(0, 1);  // Move down
    } else if (keyCode == LEFT) {
      snake.setVelocity(-1, 0); // Move left
    } else if (keyCode == RIGHT) {
      snake.setVelocity(1, 0);  // Move right
    } else if (keyCode == KeyEvent.VK_SPACE  && snakeVenom > 0) {
      // Instantiate a Venom using the snake's current velocity and position
      PVector snakePosition = snake.getSnakeCells().getLast().gridLocation.copy();
      PVector snakeVelocity = snake.getVelocity().copy();
      //if snake's position is too close to top or left border, don't create venom (otherwise whole game freezes)
      if(snakePosition.x <= 0 && snakeVelocity.x != 0 || snakePosition.y <= 0 && snakeVelocity.y != 0
        || snakePosition.y >= 44 && snakeVelocity.y != 0 || snakePosition.x >= 99 && snakeVelocity.x != 0){
        return;
      }
      if (getMapGridObjectData(PVector.add(snakePosition, snakeVelocity)) instanceof Wall) {
       return; 
      }
      
      int venomColour = color(200, 0, 200); // Set venom color (e.g., red)
      venom.add(new Venom(this, venomColour, snakePosition, snakeVelocity, snake));
      depleteVenomBar();
    }else if(keyCode==ESC){
      key=0;
    }
  }


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
          row.add(token.trim()); // Add trimmed tokens to the row list
        }
        mapData.add(row); // Add the row to the map data
      }

      // Process the map data to create wall objects
      int wallCount = 0;
      for (int y = 0; y < mapData.size(); y++) {
        ArrayList<String> row = mapData.get(y);
        for (int x = 0; x < row.size(); x++) {
          String cell = row.get(x);
          if (cell.startsWith("w")) {
            // Cell belongs to a wall
            int wallNumber = Integer.parseInt(cell.substring(1)); // Extract wall number
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
              wall.addWallCell(x, y); // Replace 0 with actual colour if needed
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

  //venom setters

  public void refillVenomBar() {
    snakeVenom +=maxVenom;
  }
  
  public void depleteVenomBar() {
    snakeVenom -=venomIncrement;
  }

  public void cleanUp() {
    // Clear walls
    walls.clear();

    // Clear consumables
    if (apple != null) {
      apple.cleanUp();
      apple = null;
    }
    if (banana != null) {
      banana.cleanUp();
      banana = null;
    }
    if (melon != null) {
      melon.cleanUp();
      melon = null;
    }
    if (venomRefillerOne != null) {
      venomRefillerOne.cleanUp();
      venomRefillerOne = null;
    }
    if (venomRefillerTwo != null) {
      venomRefillerTwo.cleanUp();
      venomRefillerTwo = null;
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



  public void printMapGrid() {
    for (int i = 0; i < ROWS; i++) {
      for (int j = 0; j < COLS; j++) {
        Object obj = mapGridObjectData[j][i];
        if (obj == null) {
          System.out.print(" "); // Empty space
        } else if (obj instanceof Snake) {
          System.out.print("s"); // Snake
        } else if (obj instanceof Wall) {
          System.out.print("w"); // Wall
        } else if (obj instanceof Food) {
          System.out.print("f"); // Food
        } else if (obj instanceof Powerup) {
          System.out.print("p"); // Powerup
        }
        System.out.print(" ");
      }
      System.out.println();
    }
  }
  
public void removeEnemySnake(EnemySnake snake) {
    for (SnakeCell cell : snake.getSnakeCells()) {
        setMapGridObjectData(cell.getGridLocation(), null); // Clear each cell from grid
    }
    enemySnakes.remove(snake); // Remove snake from list
}
}
