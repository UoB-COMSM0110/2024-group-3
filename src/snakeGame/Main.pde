// Grid/Screen Size Global Configuration: //<>//
public static final int ROWS = 45;
public static final int COLS = 100;
public static final int CELL_SIZE = 12;
public static final int width = COLS * CELL_SIZE;   //1200
public static final int height = ROWS * CELL_SIZE;  //540

// Game State Global Variables:
public static int difficulty=0;
public static int flag=0;
public GameScreen gameScreen;
public GameState state;
public enum GameState {
  OVER, PLAY, PAUSE, MENU, SCORE_SCREEN
}
public Page page;
public enum WhatPage {
  MAINPAGE, PLAYING, HIGHSCORE, HELP, SETTING, MAINPAGE_hard
}
public WhatPage curPage;

public void settings() {
  size(width, height);
}
public void setup() {
  state = GameState.PLAY;
  page=new Page();
  curPage=WhatPage.MAINPAGE;
  flag=0;
}
public void draw() {
  if (flag==0) {
    if (difficulty==0) {
      frameRate(10);
      gameScreen = new GameScreen();
      gameScreen.setup("mapsCSV/1.csv");
    } else {
      frameRate(15);
      gameScreen = new GameScreen();
      gameScreen.setup("mapsCSV/2.csv");
    }
    flag=1;
  }

  if (curPage==WhatPage.MAINPAGE) {
    difficulty=0;
    flag=0;
    page.mainPage();
  } else if (curPage==WhatPage.PLAYING) {
    if (state == GameState.OVER) {
      gameOver();
    } else {
      gameScreen.update();
    }
  } else if (curPage==WhatPage.HIGHSCORE) {
    page.highScore();
  } else if (curPage==WhatPage.HELP) {
    page.help();
  } else if (curPage==WhatPage.MAINPAGE_hard) {
    difficulty=1;
    flag=0;
    page.MAINPAGE_hard();
  }
}
void keyPressed() {
  if (curPage==WhatPage.PLAYING) {
    if (state==GameState.PLAY) {
      gameScreen.handleArrowKeyPress();
    } else if (state==GameState.OVER) {
      flag=0;
      if (keyCode==ESC) {
        if (difficulty==0) {
          curPage=WhatPage.MAINPAGE;
          gameScreen = new GameScreen();
          gameScreen.setup("mapsCSV/1.csv");
        } else {
          curPage=WhatPage.MAINPAGE_hard;
          gameScreen = new GameScreen();
          gameScreen.setup("mapsCSV/2.csv");
        }
        state = GameState.PLAY;
        key=0;
      }
    }
  } else if (curPage==WhatPage.HELP) {
    if (keyCode==ESC) {
      curPage=WhatPage.MAINPAGE;
      key=0;
    }
  }
  if (keyCode==ESC&&curPage!=WhatPage.PLAYING) {
    if (difficulty == 0) {
      curPage=WhatPage.MAINPAGE;
    } else if (difficulty == 1) {
      curPage=WhatPage.MAINPAGE_hard;
    }
    key=0;
  }
}
void mousePressed() {
  page.handlePageJump();
}
// Process Ending of Game:
public void gameOver() {
  // clean up resources used in ended game:
  gameScreen.cleanUp();

  // Draw a transparent screen over the current board state
  fill(0, 0, 0, 150); // Set fill color to black with 150 alpha (transparency)
  rect(0, 0, width, height); // Draw a rectangle covering the entire screen

  // Draw "Game Over" text
  fill(255); // Set fill color to white
  textAlign(CENTER, CENTER); // Align text to the center
  textSize(32); // Set text size
  text("Game Over", width/2, height/2); // Draw text at the center of the screen
  windowResize(width, height);
}
