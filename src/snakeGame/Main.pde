import processing.sound.*; //<>// //<>// //<>//


// Grid/Screen Size Global Configuration: //<>//
public static final int ROWS = 45;
public static final int COLS = 100;
public static final int CELL_SIZE = 12;

// 1200
public static final int width = COLS * CELL_SIZE;

// 540
public static final int height = ROWS * CELL_SIZE;

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
  MAINPAGE, PLAYING, HIGHSCORE, HELP, SETTING, MAINPAGE_hard, POPHELPPAGE
}
public WhatPage currentPage;
public int isShowTips=1;
public int isShowTips2=1;

// Default volume
public float volume=6;

// Store separately
public HighScore highScore, highScore_hard;

// Player name
public String inputName;

// Player score
public int totalScore;

// Whether to click the name box
boolean isNameBoxSelected = false;
int cursorTimer = 0;

// Whether to load sounds
boolean end = false;
public int needHelpPage=1;

// Music file
SoundFile file, file_button, file_click, file_background, file_new, file_d;

// Sound control
Sound s;

public void settings() {
  size(width, height+100);
}


public void setup() {
  gameState = GameState.PLAY;
  page = new Page();

  // Load the highscore file
  highScore = new HighScore("../mapsCSV/highscore.csv");
  highScore_hard = new HighScore("../mapsCSV/highscore_hard.csv");
  currentPage = WhatPage.MAINPAGE;
  isMapLoaded = false;
  inputName="";

  // Load the music files
  file = new SoundFile(this, sketchPath("../music/sound_1.mp3"));
  file_button = new SoundFile(this, sketchPath("../music/sound_2.mp3"));
  file_click = new SoundFile(this, sketchPath("../music/sound_3.mp3"));
  file_background = new SoundFile(this, sketchPath("../music/sound_4.mp3"));
  file_new = new SoundFile(this, sketchPath("../music/sound_5.wav"));
  file_d = new SoundFile(this, sketchPath("../music/sound_6.mp3"));
}


public void draw() {
  
  // Change the volume for all music
  s.volume(volume/12);
  background(255);
  if (!isMapLoaded) {
    Random rand = new Random();
    int mapIndex = rand.nextInt(2) + 1;
    String mapFile = "mapsCSV/" + (difficultyMode == 0 ? "E" + mapIndex : "H" + mapIndex) + ".csv";
    if (difficultyMode == 0) {
      frameRate(8);
    } else {
      frameRate(10);
    }
    gameScreen = new GameScreen();
    gameScreen.setup(mapFile);
    isMapLoaded = true;
    end = false;
  }
  if (currentPage==WhatPage.MAINPAGE) {
    end = false;
    frameRate(30);
    difficultyMode=0;
    isMapLoaded=false;
    page.mainPage();
    gameState = GameState.PLAY;
  } else if (currentPage==WhatPage.PLAYING) {
    if (gameState == GameState.OVER) {
      if (!end) {
        file_d.play();
        end = true;
      }
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
  } else if (currentPage==WhatPage.POPHELPPAGE) {
    page.popHelpPage();
  }
}


void keyPressed() {
  if (currentPage==WhatPage.PLAYING) {
    if (gameState==GameState.PLAY) {
      gameScreen.handleKeyPress();
    } else if (gameState==GameState.OVER) {
      if (isNameBoxSelected) {
        if (keyCode == BACKSPACE) {
          if (inputName.length() > 0) {
            inputName = inputName.substring(0, inputName.length() - 1);
          }
        } else if (Character.isLetterOrDigit(key)) {

          //Limit the name for letter or number
          inputName += key;
        }
      }
    }
  } else if (currentPage==WhatPage.HELP) {
    if (keyCode==ESC) {
      currentPage=WhatPage.MAINPAGE;
      key=0;
    }
  } else if (currentPage==WhatPage.POPHELPPAGE) {
    file_background.loop();
    if (keyCode!=0) {
      currentPage=WhatPage.PLAYING;
    }
  }
  
  
  // When not playing a game, pressing ESC will return to the main menu.
  if (keyCode==ESC&&currentPage!=WhatPage.PLAYING) {
    if (difficultyMode == 0) {
      currentPage=WhatPage.MAINPAGE;
    } else if (difficultyMode == 1) {
      currentPage=WhatPage.MAINPAGE_hard;
    }
    key=0;
  }
  
  // Press enter to save the data by default.
  if (keyCode == ENTER || keyCode == RETURN) {
    if (currentPage==WhatPage.MAINPAGE||currentPage==WhatPage.MAINPAGE_hard) {
      currentPage=WhatPage.POPHELPPAGE;
    } else if (currentPage==WhatPage.PLAYING&&gameState==GameState.OVER) {
      if (inputName!="") {
        if (difficultyMode == 0) {
          highScore.compare(new ScoreData(inputName, totalScore));
        } else {
          highScore_hard.compare(new ScoreData(inputName, totalScore));
        }

        inputName="";
      }
      currentPage = difficultyMode==0?WhatPage.MAINPAGE:WhatPage.MAINPAGE_hard;
      System.out.println("c");
    }
  }
}

void mousePressed() {
  page.handlePageJump();
  if (currentPage==WhatPage.SETTING) {
    page.handleSetting();
  } else if (currentPage==WhatPage.HELP) {
    page.handleHelp();
  } else if (currentPage==WhatPage.HIGHSCORE) {
    page.handleHighSco();
  } else if (currentPage==WhatPage.MAINPAGE || currentPage==WhatPage.MAINPAGE_hard) {
    page.handleDifMod();
  } else if (currentPage==WhatPage.POPHELPPAGE) {
    if (page.jumped!=1) {
      file_background.loop();
      currentPage=WhatPage.PLAYING;
    }
  }
  if (currentPage==WhatPage.PLAYING&&gameState==GameState.OVER) {
    if (mouseX >= 450 && mouseX <= 750 && mouseY >= 300 && mouseY <= 350) {
      isNameBoxSelected = true;
      file_click.play();
    } else {
      isNameBoxSelected = false;
    }
  }
}


// Process Ending of Game:
public void gameOver() {

  // Clean up resources used in ended game:
  file_background.stop();
  background(0, 0, 0);
  gameScreen.cleanUp();

  // Draw a transparent screen over the current board state
  stroke(0);

  // Set fill color to black with 150 alpha (transparency)
  fill(0, 0, 0, 150);

  // Draw a rectangle covering the entire screen
  rect(-1, -1, width+1, height+101);

  // Draw "Game Over" text
  // Set fill color to white
  fill(255);

  // Align text to the center
  textAlign(CENTER, CENTER);
  textSize(32);

  // Draw text at the center of the screen
  text("Game over! Please enter your name: ", width/2, height/2);
  textSize(64);
  fill(255, 0, 0);
  text("Final score: "+totalScore, width/2, 200);
  fill(255);
  drawNameBox();
  Button rt_but = new Button(480, 390, 720, 430, WhatPage.PLAYING, difficultyMode==0?WhatPage.MAINPAGE:WhatPage.MAINPAGE_hard, "Save", 24);
  Button exit_but = new Button(480, 460, 720, 500, WhatPage.PLAYING, difficultyMode==0?WhatPage.MAINPAGE:WhatPage.MAINPAGE_hard, "Exit", 24);
  Button re_but = new Button(480, 530, 720, 570, WhatPage.PLAYING, needHelpPage==1?WhatPage.POPHELPPAGE:WhatPage.PLAYING, "Restart", 24);
  page.butList.add(rt_but);
  page.butList.add(exit_but);
  page.butList.add(re_but);
  page.update(mouseX, mouseY);
  page.drawButton(rt_but);
  page.drawButton(exit_but);
  page.drawButton(re_but);
}

// Box for name
void drawNameBox() {
  fill(200);
  rect(450, 300, 300, 50);
  textAlign(LEFT, CENTER);
  textSize(32);
  fill(255);
  text(inputName, 460, 325);
  if (isNameBoxSelected) {
    cursorTimer++;

    //Realize the cursor flashing
    if (cursorTimer % 12 < 6) {
      float cursorX = textWidth(inputName) + 465;
      stroke(0);
      line(cursorX, 310, cursorX, 340);
    }
  }
}
