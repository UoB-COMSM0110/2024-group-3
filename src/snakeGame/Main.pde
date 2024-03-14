public static final int ROWS = 45;
public static final int COLS = 100;
public static final int CELL_SIZE = 12;

public static final int width = COLS * CELL_SIZE;
public static final int height = ROWS * CELL_SIZE;

public GameScreen gameScreen;
public GameState state;
public enum GameState {
  OVER, PLAY, PAUSE, MENU, SCORE_SCREEN
}

public Page page;
public enum WhatPage {
  MAINPAGE, PLAYING, HIGHSCORE, HELP, SETTING,
}
public WhatPage curPage;

public void settings() {
  size(width, height);
}
 //<>//
public void setup() {
  state = GameState.PLAY;
  frameRate(15);
  gameScreen = new GameScreen(); //<>//
  gameScreen.setup("mapsCSV/2.csv");
  
  page=new Page();
  curPage=WhatPage.MAINPAGE;
}

public void draw() {
  if (curPage==WhatPage.MAINPAGE) {
    page.mainPage();
  } else if (curPage==WhatPage.PLAYING) {
    if (state == GameState.OVER) {
      gameOver();
      noLoop();
    } else {
      gameScreen.update();
    }
  } else if (curPage==WhatPage.HIGHSCORE) {
    page.highScore();
  }
}

void keyPressed() {
  gameScreen.handleArrowKeyPress();
}


// Global function for game over
public void gameOver() {
  // Draw a transparent screen over the current board state
  fill(0, 0, 0, 150); // Set fill color to black with 150 alpha (transparency)
  rect(0, 0, width, height); // Draw a rectangle covering the entire screen

  // Draw "Game Over" text
  fill(255); // Set fill color to white
  textAlign(CENTER, CENTER); // Align text to the center
  textSize(32); // Set text size
  text("Game Over", width/2, height/2); // Draw text at the center of the screen
}
