import java.io.BufferedReader; //<>// //<>// //<>//
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

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


  //dynamic objects:
  private Snake snake;


  public GameScreen() {
    this.walls = new ArrayList();
    this.mapGridObjectData = new Object[height][width];
  }

  public void setup(String mapPath) {
    drawGameBoard();
    makeWalls(mapPath);
    renderWalls();
    snake = new Snake(this, 5, color(190, 0, 0));
    snake.renderSnake();
  }

  public void update() {
    // move all dynamic objects first before rendering:
    snake.move();

    // draw background:
    drawGameBoard();

    // draw all objects:
    renderWalls();
    snake.renderSnake();
  }

  public void handleArrowKeyPress() {
    if (keyCode == UP) {
      snake.setVelocity(0, -1); // Move up
    } else if (keyCode == DOWN) {
      snake.setVelocity(0, 1);  // Move down
    } else if (keyCode == LEFT) {
      snake.setVelocity(-1, 0); // Move left
    } else if (keyCode == RIGHT) {
      snake.setVelocity(1, 0);  // Move right
    }
  }



  public void setMapGridObjectData(int x, int y, Object obj) {
    this.mapGridObjectData[x][y] = obj;
  }

  public Object getMapGridObjectData(int x, int y) {
    return this.mapGridObjectData[x][y];
  }

  private void drawGameBoard() {
    background(60);
    drawGridLines();
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
}
