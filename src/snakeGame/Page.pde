public class Page
{
  ArrayList<Button> butList = new ArrayList<>(); //<>//
  PImage mainPageE,mainPageH,helpPage,highScorePage;
  boolean diffTog=false;

  public void mainPage() {
    mainPageE=loadImage("../images/mainPageEasy.png"); 
    mainPageH=loadImage("../images/mainPageHard.png");
    
    background(255);
    if (diffTog==false) {
      image(mainPageE,0,0);
    } else {
      image(mainPageH,0,0);
    }
    
    //textSize(32);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(120);
    text("SNAKE", 720, 144);

    butList.clear();

    Button sg_but = new Button(630, 268, 830,350, WhatPage.MAINPAGE, WhatPage.PLAYING, "PLAY",72);
    butList.add(sg_but);

    Button hs_but = new Button(180, 190, 360,234, WhatPage.MAINPAGE, WhatPage.HIGHSCORE, "High Score",36);
    butList.add(hs_but);

    Button set_but = new Button(180,350,360,398, WhatPage.MAINPAGE, WhatPage.HELP, "Help",36);
    butList.add(set_but);

    Button help_but = new Button(180,270,360,316, WhatPage.MAINPAGE, WhatPage.SETTING, "Settings",36);
    butList.add(help_but);
    
    Button hard_but = new Button(910,70,990,94, WhatPage.MAINPAGE, WhatPage.MAINPAGE_hard, "Hard",24);
    butList.add(hard_but);
    
    Button easy_but = new Button(910,290,990,314, WhatPage.MAINPAGE, WhatPage.MAINPAGE, "Easy",24);
    butList.add(easy_but);

    update(mouseX, mouseY);
    //drawButton(hs_but);
    //drawButton(sg_but);
    //drawButton(help_but);
    //drawButton(set_but);
    //drawButton(hard_but);
    //drawButton(easy_but);
    for (Button but:butList) {
      drawButton(but);
    }
  }
  public void MAINPAGE_hard() {
    mainPageE=loadImage("../images/mainPageEasy.png"); 
    mainPageH=loadImage("../images/mainPageHard.png");
    
    background(255);
    if (diffTog==true) {
      image(mainPageE,0,0);
    } else {
      image(mainPageH,0,0);
    }
    
    //textSize(32);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(120);
    text("SNAKE", 720, 144);
    
    butList.clear();

    Button sg_but = new Button(630, 268, 830,350, WhatPage.MAINPAGE_hard, WhatPage.PLAYING, "PLAY",72);
    butList.add(sg_but);

    Button hs_but = new Button(180, 190, 360,234, WhatPage.MAINPAGE_hard, WhatPage.HIGHSCORE, "High Score",36);
    butList.add(hs_but);

    Button set_but = new Button(180,350,360,398, WhatPage.MAINPAGE_hard, WhatPage.HELP, "Help",36);
    butList.add(set_but);

    Button help_but = new Button(180,270,360,316, WhatPage.MAINPAGE_hard, WhatPage.SETTING, "Settings",36);
    butList.add(help_but);
    
    Button hard_but = new Button(910,70,990,94, WhatPage.MAINPAGE_hard, WhatPage.MAINPAGE_hard, "Hard",24);
    butList.add(hard_but);
    
    Button easy_but = new Button(910,290,990,314, WhatPage.MAINPAGE_hard, WhatPage.MAINPAGE, "Easy",24);
    butList.add(easy_but);

    update(mouseX, mouseY);
    //drawButton(hs_but);
    //drawButton(sg_but);
    //drawButton(help_but);
    //drawButton(set_but);
    //drawButton(hard_but);
    //drawButton(easy_but);
    for (Button but:butList) {
      drawButton(but);
    }
  }

  public void highScore() {
    highScorePage=loadImage("../images/highScore.png");
    background(255);
    image(highScorePage,0,0);
    
    butList.clear();
    Button esc_but=new Button(50, 50, 150,100, WhatPage.HIGHSCORE, difficulty==0?WhatPage.MAINPAGE:WhatPage.MAINPAGE_hard, "Back",36);
    butList.add(esc_but);
  
    update(mouseX,mouseY);
    drawButton(esc_but);
    
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(80);
    text("High Score", width / 2, height / 10);
    textSize(48);
    float w=width / 2-160;
    float h=(height / 10)+100;
    for (int i = 0; i < num_highsocre; i++) {
      text(highsocre.infor[i].name,  w, h+100*i);
      text(highsocre.infor[i].score,  w+320, h+100*i);
    }
  }

  public void help() {
    helpPage=loadImage("../images/helpPageLow.png");
    image(helpPage,0,0);
    
    butList.clear();
    Button esc_but=new Button(50, 50, 150,100, WhatPage.HELP, difficulty==0?WhatPage.MAINPAGE:WhatPage.MAINPAGE_hard, "Back",36);
    butList.add(esc_but);
  
    update(mouseX,mouseY);
    drawButton(esc_but);
  }
  
  public void setting() {
    helpPage=loadImage("../images/highScore.png");
    image(helpPage,0,0);
    
    butList.clear();
    Button esc_but=new Button(50, 50, 150,100, WhatPage.SETTING, difficulty==0?WhatPage.MAINPAGE:WhatPage.MAINPAGE_hard, "Back",36);
    butList.add(esc_but);
  
    update(mouseX,mouseY);
    drawButton(esc_but);
  }

  public void drawButton(Button but) {
    //nofill();
    //fill(but.getColr(), but.getColg(), but.getColb());
    //rect(but.getX(), but.getY(), but.getW() - but.getX(), but.getV() - but.getY());

    //draw rounded rectangle
    rectMode(CORNER);
    int rad=20;
    if (but.hover==1) fill(but.bgColr,but.bgColg,but.bgColb);
    else 
    {
      noFill();
      stroke(78,68,61);
    }
    rect(but.x,but.y,but.w-but.x,but.v-but.y,rad);

    textAlign(CENTER, CENTER);
    textSize(but.txtsize);
    fill(but.colr,but.colg,but.colb);
    text(but.getTxt(), (but.getW() + but.getX()) / 2, (but.getV() + but.getY()) / 2);
    
  }

  void update(int mousex, int mousey) {
    for (int i = 0; i < butList.size(); ++i) {
      if (butList.get(i).inside(mousex, mousey)) {
        butList.get(i).setColour(99, 87, 80);
        //butList.get(i).setBgColour(255,255,255);
        butList.get(i).hover=1;
      } else butList.get(i).hover=0;
    }
  }

  public void handlePageJump() {
    for (int i = 0; i < butList.size(); ++i) {
      if (curPage == butList.get(i).getCurPag()) {
        if (butList.get(i).inside(mouseX, mouseY)) {
          curPage = butList.get(i).getPagePoi();
          break;
        }
      }
    }
  }
  
  

}
