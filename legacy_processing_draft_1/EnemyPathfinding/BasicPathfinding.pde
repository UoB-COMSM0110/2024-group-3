int scl = 20;
int foodX, foodY;
int w, h;
ArrayList<PVector> snake;
ArrayList<PVector> walls;
PVector dir, enemy;
boolean gameOver;
int enemyMoveCounter = 0; // Counter for controlling enemy movement speed
int enemyMoveDelay = 1; // Number of frames to wait before moving the enemy again

void setup() {
  size(1500, 1000);
  w = floor(width / scl);
  h = floor(height / scl);
  snake = new ArrayList<PVector>();
  walls = new ArrayList<PVector>();
  snake.add(new PVector(floor(w/2), floor(h/2)));
  dir = new PVector(0, 0);
  enemy = new PVector(0, 0); // Initialize the enemy at the top left corner.
  frameRate(10);
  pickLocation();
  generateWalls(5); // Generate 5 random walls
}

void generateWalls(int n) {
  for (int i = 0; i < n; i++) {
    int wallX = floor(random(1, w-1));
    int wallY = floor(random(1, h-1));
    walls.add(new PVector(wallX, wallY));
  }
}

void pickLocation() {
  int cols = floor(width / scl);
  int rows = floor(height / scl);
  foodX = floor(random(cols));
  foodY = floor(random(rows));
}

void draw() {
  background(51);
  if (!gameOver) {
    if (snake.get(0).x < 0 || snake.get(0).x >= w || snake.get(0).y < 0 || snake.get(0).y >= h) {
      gameOver = true;
    }
    for (int i = 0; i < snake.size(); i++) {
      if (enemy.x == snake.get(i).x && enemy.y == snake.get(i).y) {
        gameOver = true;
      }
    }
    for (PVector wall : walls) {
      if ((snake.get(0).x == wall.x && snake.get(0).y == wall.y) ||
          (enemy.x == wall.x && enemy.y == wall.y)) {
        gameOver = true;
      }
    }
    if (!gameOver) {
      update();
      checkFood();
      if (enemyMoveCounter++ >= enemyMoveDelay) {
        moveEnemy(); // Move enemy towards the snake.
        enemyMoveCounter = 0; // Reset the counter
      }
    } else {
      fill(255, 0, 0);
      textSize(32);
      textAlign(CENTER, CENTER);
      text("Game Over", width / 2, height / 2);
    }
  }
  for (PVector v : snake) {
    fill(255);
    noStroke();
    rect(v.x * scl, v.y * scl, scl, scl);
  }
  for (PVector wall : walls) {
    fill(0, 0, 255);
    rect(wall.x * scl, wall.y * scl, scl, scl);
  }
  fill(255, 0, 100);
  rect(foodX * scl, foodY * scl, scl, scl);
  fill(0, 255, 0); // Draw enemy in green
  rect(enemy.x * scl, enemy.y * scl, scl, scl);
}

void update() {
  PVector head = snake.get(0).copy();
  head.add(dir);
  snake.add(0, head);
  if (!(head.x == foodX && head.y == foodY)) {
    snake.remove(snake.size() - 1);
  }
}

void keyPressed() {
  if (keyCode == UP && dir.y == 0) {
    dir.set(0, -1);
  } else if (keyCode == DOWN && dir.y == 0) {
    dir.set(0, 1);
  } else if (keyCode == LEFT && dir.x == 0) {
    dir.set(-1, 0);
  } else if (keyCode == RIGHT && dir.x == 0) {
    dir.set(1, 0);
  }
}

void checkFood() {
  if (snake.get(0).x == foodX && snake.get(0).y == foodY) {
    pickLocation();
  }
}

void moveEnemy() {
  float minDist = dist(enemy.x, enemy.y, snake.get(0).x, snake.get(0).y);
  PVector bestMove = enemy.copy();
  // Add diagonal moves to the array
  PVector[] moves = {
    new PVector(1, 0), new PVector(-1, 0), // Right, Left
    new PVector(0, 1), new PVector(0, -1), // Down, Up
    new PVector(1, 1), new PVector(1, -1), // Down-Right, Up-Right
    new PVector(-1, 1), new PVector(-1, -1) // Down-Left, Up-Left
  };
  for (PVector move : moves) {
    PVector newPos = enemy.copy().add(move);
    boolean hitsWall = false;
    for (PVector wall : walls) {
      if (newPos.x == wall.x && newPos.y == wall.y) {
        hitsWall = true;
        break;
      }
    }
    if (!hitsWall) {
      float newDist = dist(newPos.x, newPos.y, snake.get(0).x, snake.get(0).y);
      if (newDist < minDist) {
        bestMove = newPos;
        minDist = newDist;
      }
    }
  }
  enemy.set(bestMove);
}
