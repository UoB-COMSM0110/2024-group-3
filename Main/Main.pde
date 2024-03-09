public static final int ROWS = 50;
public static final int COLS = 100;
final int CELL_SIZE = 12;

// Direction constants
final int UP = 0;
final int RIGHT = 1;
final int DOWN = 2;
final int LEFT = 3;

int currentPage = 0;

// Screens
GameScreen gameScreen;
int width = COLS * CELL_SIZE;
int height = ROWS * CELL_SIZE;

ArrayList<Button> butList = new ArrayList<>();
private MenuBar menuBar = new MenuBar(0, 0, false);

public void settings() {
  size(COLS * GridCell.cellSize, ROWS * GridCell.cellSize);
}
public void setup() {
  gameScreen = new GameScreen(this);

}
public void draw() {
  if (currentPage == 0) {
    background(255);
    textSize(32);
    fill(0);
    textAlign(CENTER, CENTER);
    noFill();
    text("Snake Game", width / 2, height / 10);

    Button sg_but = new Button(width / 2 - 130, height / 2 - 30, width / 2 + 120, height / 2 + 50, 0, 1, "Start game");
    butList.add(sg_but);

    Button hs_but = new Button(width / 2 - 130, height / 2 + 70, width / 2 + 120, height / 2 + 150, 0, 2, "High Score");
    butList.add(hs_but);

    Button help_but = new Button(width / 2 - 130, height / 2 + 170, width / 2 + 120, height / 2 + 250, 0, 3, "Help");
    butList.add(help_but);

    update(mouseX, mouseY);
    drawButton(hs_but);
    drawButton(sg_but);
    drawButton(help_but);
  } else if (currentPage == 1) {
    background(60); // Darkish grey background
    gameScreen.update();
    gameScreen.draw();
    //drawGridLines();
    //drawMenuBar();
  } else if (currentPage == 2) {
    background(255);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(120);
    text("High Score", (width / 2), 130);
    textSize(70);
    text("Name1", width / 3, 500);
    text("Score1", 1100, 500);
    text("Name2", 700, 650);
    text("Score2", 1100, 650);
  }
}
void update(int mousex, int mousey) {
  for (int i = 0; i < butList.size(); ++i) {
    if (butList.get(i).inside(mousex, mousey)) {
      butList.get(i).setColour(250, 250, 0);
    }
  }
}

private void drawMenuBar() {
  fill(0);
  rect(0, 0, width, 40);

  fill(255);
  textSize(20);
  textAlign(LEFT, CENTER);
  text("Time: " + menuBar.getTimeElapsed(), 60, 20);

  textAlign(CENTER, CENTER);
  text("Score: " + menuBar.getScore(), width / 2, 20);

  textAlign(RIGHT, CENTER);
  String activeText = menuBar.getVenomActive() ? "Active" : "Inactive";
  text("VenomStatus: " + activeText, width - 300, 20);
}

private void drawGridLines() {
  stroke(100);

  // Draw vertical lines
  for (int i = 0; i <= COLS; i++) {
    float x = i * CELL_SIZE;
    line(x, 0, x, height);
  }

  // Draw horizontal lines
  for (int j = 0; j <= ROWS; j++) {
    float y = j * CELL_SIZE;
    line(0, y, width, y);
  }
}

public void drawButton(Button but) {
  fill(but.getColr(), but.getColg(), but.getColb());
  rect(but.getX(), but.getY(), but.getW() - but.getX(), but.getV() - but.getY());

  textAlign(CENTER, CENTER);
  fill(0);
  text(but.getTxt(), (but.getW() + but.getX()) / 2, (but.getV() + but.getY()) / 2);
}

public void mousePressed() {
  for (int i = 0; i < butList.size(); ++i) {
    if (currentPage == butList.get(i).getCurPag()) {
      if (butList.get(i).inside(mouseX, mouseY)) {
        currentPage = butList.get(i).getPagePoi();
        break;
      }
    }
  }
}

public void keyPressed() {
  if (keyCode == ESC) {
    currentPage = 0;
    key = 0;
  }
}
