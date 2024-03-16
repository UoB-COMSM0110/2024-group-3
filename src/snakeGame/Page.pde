public class Page
{
  ArrayList<Button> butList = new ArrayList<>(); //<>//
  PImage mainPageE,mainPageH,helpPage;
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

    Button sg_but = new Button(660, 288, 800,330, WhatPage.MAINPAGE, WhatPage.PLAYING, "PLAY",72);
    butList.add(sg_but);

    Button hs_but = new Button(192, 200, 350,224, WhatPage.MAINPAGE, WhatPage.HIGHSCORE, "High Score",36);
    butList.add(hs_but);

    Button set_but = new Button(228,360,310,388, WhatPage.MAINPAGE, WhatPage.HELP, "Settings",36);
    butList.add(set_but);

    Button help_but = new Button(210,280,330,306, WhatPage.MAINPAGE, WhatPage.HELP, "Help",36);
    butList.add(help_but);

    update(mouseX, mouseY);
    drawButton(hs_but);
    drawButton(sg_but);
    drawButton(help_but);
    drawButton(set_but);
  }

  public void highScore() {
    background(255);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(80);
    text("High Score", width / 2, height / 10);
    textSize(48);
    text("Name1",  width / 2-160, (height / 10)+100);
    text("Score1",  width / 2+160, (height / 10)+100);
    text("Name2",  width / 2-160, (height / 10)+200);
    text("Score2",  width / 2+160, (height / 10)+200);
    text("Name3",  width / 2-160, (height / 10)+300);
    text("Score3",  width / 2+160, (height / 10)+300);
    text("Name4",  width / 2-160, (height / 10)+400);
    text("Score4",  width / 2+160, (height / 10)+400);
  }

  public void help() {
    helpPage=loadImage("../images/helpPageLow.png");
    helpPage.resize(width,height);
    image(helpPage,0,0);
  }

  public void drawButton(Button but) {
    //nofill();
    //fill(but.getColr(), but.getColg(), but.getColb());
    //rect(but.getX(), but.getY(), but.getW() - but.getX(), but.getV() - but.getY());

    textAlign(CENTER, CENTER);
    textSize(but.txtsize);
    fill(but.colr,but.colg,but.colb);
    text(but.getTxt(), (but.getW() + but.getX()) / 2, (but.getV() + but.getY()) / 2);
  }

  void update(int mousex, int mousey) {
    for (int i = 0; i < butList.size(); ++i) {
      if (butList.get(i).inside(mousex, mousey)) {
        butList.get(i).setColour(250, 250, 0);
      }
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

  //public void handleEsc() {
  //  if (keyCode==ESC) {
  //    curPage=WhatPage.MAINPAGE;
  //    key=0;
  //  }
  //}
}
