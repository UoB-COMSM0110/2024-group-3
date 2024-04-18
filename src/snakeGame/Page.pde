public class Page //<>// //<>// //<>//
{
  ArrayList<Button> butList = new ArrayList<>();
  
  Button volMinus=new Button(500, 180, 550, 230, "-", 36);
  Button volPlus=new Button(850, 180, 900, 230, "+", 36);
  Button tips=new Button(850, 280, 900, 330, " ", 36);
  Button tips2=new Button(850, 380, 900, 430, " ", 36);
  Button hard=new Button(940, 140, 970, 170, " ", 36);
  Button easy=new Button(940, 355, 970, 385, " ", 36);
  
  
  Button helpPrePag=new Button(400,550,450,600,"<",36);
  Button helpNexPag=new Button(750,550,800,600,">",36);
  
  Button highScoPrePag=new Button(400,550,450,600,"<",36);
  Button highScoNexPag=new Button(750,550,800,600,">",36);
  
  PImage mainPageE, mainPageH, helpPage, highScorePage,checkIcon;
  boolean diffTog=false;
  
  int helpPagInd=1,highScoPagInd=1;
  int maxVolume=12,maxHelpInd=2,maxHighScoInd=2;

  public void mainPage() {
    mainPageE=loadImage("../images/mainPageEasy.png");
    mainPageH=loadImage("../images/mainPageHard.png");

    background(255);
    if (diffTog==false) {
      image(mainPageE, 0, 0);
    } else {
      image(mainPageH, 0, 0);
    }

    //textSize(32);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(100);
    text("SURVIVAL", 690, 150);
    text("SNAKE", 690, 240);

    textSize(30);
    text("Hard",955,120);
    text("Easy",955,335);

    butList.clear();

    Button sg_but = new Button(600, 340, 800, 420, WhatPage.MAINPAGE, WhatPage.PLAYING, "PLAY", 72);
    butList.add(sg_but);

    Button hs_but = new Button(180, 190, 360, 234, WhatPage.MAINPAGE, WhatPage.HIGHSCORE, "High Score", 36);
    butList.add(hs_but);

    Button set_but = new Button(180, 350, 360, 398, WhatPage.MAINPAGE, WhatPage.HELP, "Help", 36);
    butList.add(set_but);

    Button help_but = new Button(180, 270, 360, 316, WhatPage.MAINPAGE, WhatPage.SETTING, "Settings", 36);
    butList.add(help_but);

    //Button hard_but = new Button(900, 70, 990, 105, WhatPage.MAINPAGE, WhatPage.MAINPAGE_hard, "Hard"+(difficultyMode==1?" √":""), 24);
    //butList.add(hard_but);

    //Button easy_but = new Button(900, 290, 990, 325, WhatPage.MAINPAGE, WhatPage.MAINPAGE, "Easy"+(difficultyMode==0?" √":""), 24);
    //butList.add(easy_but);

    update(mouseX, mouseY);
    
    //if (difficultyMode==0) {
    //  easy_but.hover=1;
    //}
    //else {
    //  hard_but.hover=1;
    //}
    //drawButton(hs_but);
    //drawButton(sg_but);
    //drawButton(help_but);
    //drawButton(set_but);
    //drawButton(hard_but);
    //drawButton(easy_but);
    drawTipsButton(easy);
    drawTipsButton(hard);
    checkIcon=loadImage("../images/check.png");
    checkIcon.resize(easy.w-easy.x,easy.v-easy.y);
    image(checkIcon,easy.x,easy.y);
    for (Button but : butList) {
      drawButton(but);
    }
  }
  public void MAINPAGE_hard() {
    mainPageE=loadImage("../images/mainPageEasy.png");
    mainPageH=loadImage("../images/mainPageHard.png");

    background(255);
    if (diffTog==true) {
      image(mainPageE, 0, 0);
    } else {
      image(mainPageH, 0, 0);
    }

    //textSize(32);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(100);
    text("SURVIVAL", 690, 150);
    text("SNAKE", 690, 240);
    
    textSize(30);
    text("Hard",955,120);
    text("Easy",955,335);

    butList.clear();

    Button sg_but = new Button(600, 340, 800, 420, WhatPage.MAINPAGE_hard, WhatPage.PLAYING, "PLAY", 72);
    butList.add(sg_but);

    Button hs_but = new Button(180, 190, 360, 234, WhatPage.MAINPAGE_hard, WhatPage.HIGHSCORE, "High Score", 36);
    butList.add(hs_but);

    Button set_but = new Button(180, 350, 360, 398, WhatPage.MAINPAGE_hard, WhatPage.HELP, "Help", 36);
    butList.add(set_but);

    Button help_but = new Button(180, 270, 360, 316, WhatPage.MAINPAGE_hard, WhatPage.SETTING, "Settings", 36);
    butList.add(help_but);

    //Button hard_but = new Button(900, 70, 990, 105, WhatPage.MAINPAGE_hard, WhatPage.MAINPAGE_hard, "Hard"+(difficultyMode==1?" √":""), 24);
    //butList.add(hard_but);

    //Button easy_but = new Button(900, 290, 990, 325, WhatPage.MAINPAGE_hard, WhatPage.MAINPAGE, "Easy"+(difficultyMode==0?" √":""), 24);
    //butList.add(easy_but);

    update(mouseX, mouseY);
    
    //if (difficultyMode==0) {
    //  easy_but.hover=1;
    //}
    //else {
    //  hard_but.hover=1;
    //}
    //drawButton(hs_but);
    //drawButton(sg_but);
    //drawButton(help_but);
    //drawButton(set_but);
    //drawButton(hard_but);
    //drawButton(easy_but);
    drawTipsButton(easy);
    drawTipsButton(hard);
    checkIcon=loadImage("../images/check.png");
    checkIcon.resize(hard.w-hard.x,hard.v-hard.y);
    image(checkIcon,hard.x,hard.y);
    for (Button but : butList) {
      drawButton(but);
    }
  }

  public void highScore() {
    highScorePage=loadImage("../images/highScore.png");
    background(255);
    image(highScorePage, 0, 0);

    butList.clear();
    Button esc_but=new Button(50, 50, 150, 100, WhatPage.HIGHSCORE, difficultyMode==0?WhatPage.MAINPAGE:WhatPage.MAINPAGE_hard, "Back", 36);
    butList.add(esc_but);

    fill(255);
    textSize(24);
    textAlign(CENTER,CENTER);
    text(highScoPagInd+" / "+maxHighScoInd,width/2,575);

    update(mouseX, mouseY);
    drawButton(highScoPrePag);
    drawButton(highScoNexPag);
    drawButton(esc_but);

    if (highScoPagInd==1) {
      fill(255);
      textAlign(CENTER, CENTER);
      textSize(80);
      text("High Score Easy", width / 2, height / 10);
      textSize(48);
      float w=width / 2-160;
      float h=(height / 10)+100;
      for (int i = 0; i < highScoreNumber; i++) {
        text(highScore.infor[i].name, w, h+100*i);
        text(highScore.infor[i].score, w+320, h+100*i);
      }
    } else {
      fill(255);
      textAlign(CENTER, CENTER);
      textSize(80);
      text("High Score Hard", width / 2, height / 10);
      textSize(48);
      float w=width / 2-160;
      float h=(height / 10)+100;
      for (int i = 0; i < highScoreNumber; i++) {
        text(highScore_hard.infor[i].name, w, h+100*i);
        text(highScore_hard.infor[i].score, w+320, h+100*i);
      }
      
    }
  }

  public void help() {
    helpPage=loadImage("../images/helpPageLow"+helpPagInd+".png");
    image(helpPage, 0, 0);

    butList.clear();
    Button esc_but=new Button(50, 50, 150, 100, WhatPage.HELP, difficultyMode==0?WhatPage.MAINPAGE:WhatPage.MAINPAGE_hard, "Back", 36);
    butList.add(esc_but);

    fill(255);
    textSize(24);
    textAlign(CENTER,CENTER);
    text(helpPagInd+" / "+maxHelpInd,width/2,575);

    update(mouseX, mouseY);
    drawButton(helpPrePag);
    drawButton(helpNexPag);
    drawButton(esc_but);
  }

  public void setting() {
    helpPage=loadImage("../images/highScore.png");
    image(helpPage, 0, 0);

    // back button
    butList.clear();
    Button esc_but=new Button(50, 50, 150, 100, WhatPage.SETTING, difficultyMode==0?WhatPage.MAINPAGE:WhatPage.MAINPAGE_hard, "Back", 36);
    butList.add(esc_but);

    fill(255);
    textAlign(CENTER,CENTER);
    textSize(48);
    text("Settings",width/2,70);
    
    textAlign(LEFT,TOP);
    textSize(36);
    text("Volume",300,190);
    text("Display prompts during the game",300,290);
    text("Display grid during the game",300,390);
    
    //textAlign(LEFT,BOTTOM);
    //text(". . . . . . . . . . ",560,190);
    String st="";
    for (int i=0;i<12;++i) {
      if (i<volume) st=st+"|";
      else st=st+".";
      st=st+"  ";
    }
    text(st,565,190);

    update(mouseX, mouseY);

    drawButton(volPlus);
    drawButton(volMinus);
    drawTipsButton(tips);
    drawTipsButton(tips2);
    if (isShowTips==1) {
      checkIcon=loadImage("../images/check.png");
      checkIcon.resize(tips.w-tips.x,tips.v-tips.y);
      image(checkIcon,tips.x,tips.y);
    }
    if (isShowTips2==1) {
      checkIcon=loadImage("../images/check.png");
      checkIcon.resize(tips2.w-tips2.x,tips2.v-tips2.y);
      image(checkIcon,tips2.x,tips2.y);
    }
    drawButton(esc_but);
    
  }

  public void drawButton(Button but) {
    //nofill();
    //fill(but.getColr(), but.getColg(), but.getColb());
    //rect(but.getX(), but.getY(), but.getW() - but.getX(), but.getV() - but.getY());

    //draw rounded rectangle
    rectMode(CORNER);
    int rad=20;
    if (but.hover==0) fill(but.bgColr, but.bgColg, but.bgColb);
    else
    {
      noFill();
      stroke(255);
    }
    rect(but.x, but.y, but.w-but.x, but.v-but.y, rad);

    textAlign(CENTER, CENTER);
    textSize(but.txtsize);
    if (but.hover==1) {
      //fill(but.colr, but.colg, but.colb);
      fill(but.bgColr,but.bgColg,but.bgColb);
    } else {
      fill(but.colr,but.colg,but.colb);
    }

    text(but.getTxt(), (but.getW() + but.getX()) / 2, (but.getV() + but.getY()) / 2);
  }
  
  public void drawTipsButton(Button but) {
    rectMode(CORNER);
    int rad=10;
    noFill();
    stroke(255);
    rect(but.x, but.y, but.w-but.x, but.v-but.y, rad);
    return;
  }

  void update(int mousex, int mousey) {
    for (int i = 0; i < butList.size(); ++i) {
      if (butList.get(i).inside(mousex, mousey)) {
        butList.get(i).setColour(99, 87, 80);
        //butList.get(i).setBgColour(255,255,255);
        butList.get(i).hover=1;
      } else butList.get(i).hover=0;
    }
    if (currentPage==WhatPage.SETTING) {
      if (volPlus.inside(mouseX, mouseY)) {
        volPlus.hover=1;
      } else volPlus.hover=0;
      if (volMinus.inside(mouseX, mouseY)) {
        volMinus.hover=1;
      } else volMinus.hover=0;
      if (tips.inside(mouseX, mouseY)) {
        tips.hover=1;
      } else tips.hover=0;
    }
    if (currentPage==WhatPage.HELP) {
      if (helpPrePag.inside(mouseX,mouseY)) {
        helpPrePag.hover=1;
      } else helpPrePag.hover=0;
      if (helpNexPag.inside(mouseX,mouseY)) {
        helpNexPag.hover=1;
      } else helpNexPag.hover=0;
    }
    if (currentPage==WhatPage.HIGHSCORE) {
      if (highScoPrePag.inside(mouseX,mouseY)) {
        highScoPrePag.hover=1;
      } else highScoPrePag.hover=0;
      if (highScoNexPag.inside(mouseX,mouseY)) {
        highScoNexPag.hover=1;
      } else highScoNexPag.hover=0;
    }
  }

  public void handleHelp() {
    if (helpPrePag.inside(mouseX,mouseY)) {
      if (helpPagInd>1) --helpPagInd;
    }
    else if (helpNexPag.inside(mouseX,mouseY)) {
      if (helpPagInd<maxHelpInd) ++helpPagInd;
    }
  }
  
  public void handleHighSco() {
    if (highScoPrePag.inside(mouseX,mouseY)) {
      if (highScoPagInd>1) --highScoPagInd;
    }
    else if (highScoNexPag.inside(mouseX,mouseY)) {
      if (highScoPagInd<maxHighScoInd) ++highScoPagInd;
    }
  }

  public void handleDifMod() {
    if (easy.inside(mouseX,mouseY)) {
      println("easy");
      difficultyMode=0;
      currentPage=WhatPage.MAINPAGE;
    } else if (hard.inside(mouseX,mouseY)) {
      println("hard");
      difficultyMode=1;
      currentPage=WhatPage.MAINPAGE_hard;
    }
  }

  public void handleSetting() {
    if (volPlus.inside(mouseX,mouseY)) {
      //volume=min(11,volume+1);
      if (volume<maxVolume) ++volume;
    } 
    else if (volMinus.inside(mouseX,mouseY)) {
      //volume=max(0,volume-1);
      if (volume>0) --volume;
    }
    else if (tips.inside(mouseX,mouseY)) {
      isShowTips^=1;
      System.out.println("isShowTips"+isShowTips);
    }
    else if (tips2.inside(mouseX,mouseY)) {
      isShowTips2^=1;
      System.out.println("isShowTips2"+isShowTips2);
    }
  }

  public void handlePageJump() {
    for (int i = 0; i < butList.size(); ++i) {
      if (currentPage == butList.get(i).getCurPag()) {
        if (butList.get(i).inside(mouseX, mouseY)) {
          if (gameState == GameState.OVER&&currentPage==WhatPage.PLAYING) {
            if (inputName!="") {
              if(difficultyMode==0){
                highScore.compare(new ScoreData(inputName, totalScore));
              }else{
                highScore_hard.compare(new ScoreData(inputName, totalScore));
              }
              
              inputName="";
            }
          }
          currentPage = butList.get(i).getPagePoi();
          break;
        }
      }
    }
  }
}
