// Grid/Screen Size Global Configuration: //<>//
public static final int ROWS = 45;
public static final int COLS = 100;
public static final int CELL_SIZE = 12;
public static final int width = COLS * CELL_SIZE;   //1200
public static final int height = ROWS * CELL_SIZE;  //540

// Game State Global Variables:
public static int difficulty=0;
public static int flag=0;
public static int num_highsocre=4;
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
public Highsocre highsocre;

public void settings() {
  size(width, height);
}
public void setup() {
  state = GameState.PLAY;
  page=new Page();
  highsocre=new Highsocre();
  curPage=WhatPage.MAINPAGE;
  flag=0;
}
public void draw() {
  //background(255);
  
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
    state = GameState.PLAY;
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
    state = GameState.PLAY;
  }
}
void keyPressed() {
  if (curPage==WhatPage.PLAYING) {
    if (state==GameState.PLAY) {
      gameScreen.handleKeyPress();
    } else if (state==GameState.OVER) {
      
      if (keyCode==ESC) {
        flag=0;
        if (difficulty==0) {
          curPage=WhatPage.MAINPAGE;
        } else {
          curPage=WhatPage.MAINPAGE_hard;
        }
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
  
  Button rt_but = new Button(480, 440, 720,480, WhatPage.PLAYING,difficulty==0?WhatPage.MAINPAGE:WhatPage.MAINPAGE_hard, "Return to main menu",24);
  page.butList.add(rt_but);
  page.update(mouseX,mouseY);
  page.drawButton(rt_but);
  
  windowResize(width, height);
}

//void handleReturn(Button but) 
//{
//  if (but.inside(mouseX,mouseY)) {
//    but.hover=1;
//  } else {
//    but.hover=0;
//  }
  
//  return;
//}
