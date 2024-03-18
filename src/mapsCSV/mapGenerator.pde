import javax.swing.JOptionPane;

//PImage canvas;
//int cols = 100; // Number of columns
//int rows = 45; // Number of rows
//int cellSize = 12; // Size of each cell
//int wallCounter = 1; // Counter to track the current wall
//String currentWall = "w" + wallCounter; // Current wall identifier

void settings(){
 size(cols * cellSize, rows * cellSize); 
}

PImage canvas;
int cols = 100; // Number of columns
int rows = 45; // Number of rows
int cellSize = 12; // Size of each cell
String[][] wallGrid = new String[cols][rows]; // 2D array to store wall identifiers at each grid location
int wallCounter = 1; // Counter to track the current wall

void setup() {
  size(cols * cellSize, rows * cellSize);
  canvas = createImage(cols, rows, RGB);
  canvas.loadPixels();
  // Initialize canvas with empty spaces
  for (int i = 0; i < cols * rows; i++) {
    canvas.pixels[i] = color(255); // White for empty space
  }
  canvas.updatePixels();
}

void draw() {
  background(255);
  image(canvas, 0, 0, width, height);
  
  // Display current wall identifier
  fill(0);
  textSize(16);
  text("Current Wall: " + wallCounter, 10, 20);
}

boolean eraseMode = false;

void mouseDragged() {
  int col = mouseX / cellSize;
  int row = mouseY / cellSize;
  if (col >= 0 && col < cols && row >= 0 && row < rows) {
    if (eraseMode) {
      canvas.set(col, row, color(255)); // White to erase walls
      wallGrid[col][row] = null; // Remove wall identifier
    } else {
      canvas.set(col, row, color(0)); // Black for walls
      wallGrid[col][row] = "w" + wallCounter; // Update wall identifier at this grid location
    }
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    String fileName = JOptionPane.showInputDialog("Enter filename (without extension):");
    if (fileName != null && !fileName.isEmpty()) {
      saveMapAsCSV(fileName);
    } else {
      println("Error: Filename cannot be empty.");
    }
  } else if (key == 'w' || key == 'W'){
    eraseMode = !eraseMode;
  } else if (key == CODED) {
    if (keyCode == LEFT) {
      wallCounter--; // Decrease wall count
      if (wallCounter < 1) wallCounter = 1; // Ensure wall count doesn't go below 1
    } else if (keyCode == RIGHT) {
      wallCounter++; // Increase wall count
    }
  }
}

void saveMapAsCSV(String fileName) {
  String[] lines = new String[rows];
  for (int i = 0; i < rows; i++) {
    StringBuilder line = new StringBuilder();
    for (int j = 0; j < cols; j++) {
      if (wallGrid[j][i] != null) {
        line.append(wallGrid[j][i]); // Append wall identifier if present
      } else {
        line.append(""); // Empty for empty space
      }
      if (j < cols - 1) {
        line.append(",");
      }
    }
    lines[i] = line.toString();
  }
  saveStrings(fileName + ".csv", lines);
  println("Map saved as " + fileName + ".csv in the current directory.");
}
