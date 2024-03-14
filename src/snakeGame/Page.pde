public class Page 
{
  
  ArrayList<Button> butList = new ArrayList<>();
  
  public void mainPage() {
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
  }
  
  public void drawButton(Button but) {
    fill(but.getColr(), but.getColg(), but.getColb());
    rect(but.getX(), but.getY(), but.getW() - but.getX(), but.getV() - but.getY());
  
    textAlign(CENTER, CENTER);
    fill(0);
    text(but.getTxt(), (but.getW() + but.getX()) / 2, (but.getV() + but.getY()) / 2);
  }
  
  void update(int mousex, int mousey) {
    for (int i = 0; i < butList.size(); ++i) {
      if (butList.get(i).inside(mousex, mousey)) {
        butList.get(i).setColour(250, 250, 0);
      }
  }
}
