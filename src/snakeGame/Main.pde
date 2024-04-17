// Grid/Screen Size Global Configuration: //<>//
public static final int ROWS = 45;
public static final int COLS = 100;
public static final int CELL_SIZE = 12;
public static final int width = COLS * CELL_SIZE;   //1200
public static final int height = ROWS * CELL_SIZE;  //540

// Game State Global Variables:
public static int difficultyMode = 0;
public static boolean isMapLoaded = false;
public static int highScoreNumber = 4;
public GameScreen gameScreen;
public GameState gameState;
public enum GameState {
  OVER, PLAY, PAUSE, MENU, SCORE_SCREEN
}
public Page page;
public enum WhatPage {
  MAINPAGE, PLAYING, HIGHSCORE, HELP, SETTING, MAINPAGE_hard
}
public WhatPage currentPage;
public int isShowTips=1;
public int volume=0;
public HighScore highScore;
public String inputName;
public int totalFoodEaten;

public void settings() {
  size(width, height);
}
public void setup() {
  //background(255);
  gameState = GameState.PLAY;
  page = new Page();
  highScore = new HighScore();
  currentPage = WhatPage.MAINPAGE;
  isMapLoaded = false;
  inputName="";
}
public void draw() {
  background(255);

  if (!isMapLoaded) {
    if (difficultyMode==0) {
      frameRate(8);
      gameScreen = new GameScreen();
      gameScreen.setup("mapsCSV/1.csv");
    } else {
      frameRate(13);
      gameScreen = new GameScreen();
      gameScreen.setup("mapsCSV/2.csv");
    }
    isMapLoaded=true;
  }
  if (currentPage==WhatPage.MAINPAGE) {
    frameRate(30);
    difficultyMode=0;
    isMapLoaded=false;
    page.mainPage();
    gameState = GameState.PLAY;
  } else if (currentPage==WhatPage.PLAYING) {
    if (gameState == GameState.OVER) {
      gameOver();
    } else {
      gameScreen.update();
    }
  } else if (currentPage==WhatPage.HIGHSCORE) {
    page.highScore();
  } else if (currentPage==WhatPage.HELP) {
    page.help();
  } else if (currentPage==WhatPage.SETTING) {
    page.setting();
  } else if (currentPage==WhatPage.MAINPAGE_hard) {
    frameRate(30);
    difficultyMode=1;
    isMapLoaded=false;
    page.MAINPAGE_hard();
    gameState = GameState.PLAY;
  }
}
void keyPressed() {
  if (currentPage==WhatPage.PLAYING) {
    if (gameState==GameState.PLAY) {
      gameScreen.handleKeyPress();
    } else if (gameState==GameState.OVER) {
      if (keyCode == BACKSPACE) {
        if (inputName.length() > 0) {
          inputName = inputName.substring(0, inputName.length() - 1);
        }
      } else if (Character.isLetterOrDigit(key)) {
        inputName += key;
      }else if (keyCode == ENTER || keyCode == RETURN) {
        if (inputName!="") {
          highScore.compare(new ScoreData(inputName, totalFoodEaten));
          inputName="";
        }
        currentPage = difficultyMode==0?WhatPage.MAINPAGE:WhatPage.MAINPAGE_hard;
      }
      if (keyCode==ESC) {
        //isMapLoaded=false;
        //if (difficultyMode==0) {
        //  currentPage=WhatPage.MAINPAGE;
        //} else {
        //  currentPage=WhatPage.MAINPAGE_hard;
        //}
        key=0;
      }
    }
  } else if (currentPage==WhatPage.HELP) {
    if (keyCode==ESC) {
      currentPage=WhatPage.MAINPAGE;
      key=0;
    }
  }
  if (keyCode==ESC&&currentPage!=WhatPage.PLAYING) {
    if (difficultyMode == 0) {
      currentPage=WhatPage.MAINPAGE;
    } else if (difficultyMode == 1) {
      currentPage=WhatPage.MAINPAGE_hard;
    }
    key=0;
  }
  
  
  
  
  
  if ((keyCode == ENTER || keyCode == RETURN)&&(currentPage==WhatPage.MAINPAGE||currentPage==WhatPage.MAINPAGE_hard)) {
    currentPage=WhatPage.PLAYING;
  }
  
}
void mousePressed() {
  page.handlePageJump();
  if (currentPage==WhatPage.SETTING) {
    page.handleSetting();
  } else if (currentPage==WhatPage.HELP) {
    page.handleHelp();
  }
}
// Process Ending of Game:
public void gameOver() {
  // clean up resources used in ended game:
  background(0,0,0);
  gameScreen.cleanUp();

  // Draw a transparent screen over the current board state
  fill(0, 0, 0, 150); // Set fill color to black with 150 alpha (transparency)
  rect(0, 0, width, height); // Draw a rectangle covering the entire screen

  // Draw "Game Over" text
  fill(255); // Set fill color to white
  textAlign(CENTER, CENTER); // Align text to the center
  textSize(32); // Set text size
  text("Game Over,Please enter name", width/2, height/2); // Draw text at the center of the screen
  textSize(64);
  fill(255, 0, 0);
  text("Final score:"+totalFoodEaten, width/2, 200);
  fill(255);
  drawNameBox();
  Button rt_but = new Button(480, 440, 720, 480, WhatPage.PLAYING, difficultyMode==0?WhatPage.MAINPAGE:WhatPage.MAINPAGE_hard, "Save and Return", 24);
  page.butList.add(rt_but);
  page.update(mouseX, mouseY);
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
void drawNameBox() {
  fill(200);
  rect(450, 300, 300, 50);
  textAlign(LEFT, CENTER);
  textSize(32);
  fill(0);
  text(inputName, 460, 325);
}
