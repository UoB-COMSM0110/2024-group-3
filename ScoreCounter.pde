int snakeLength = 1;
int snakeScore = 0;
long startTime;
boolean showPlusTen = false;
int plusTenStartTime;

void setup() {
  size(1500, 1000);
  textSize(48);
  startTime = millis();
}

void draw() {
  background(220);
  
  int currentTime = (millis() - (int)startTime) / 1000; 
  snakeScore = currentTime;
  
  fill(0);
  text("LENGTH: " + snakeLength, 10, 50);
  text("SCORE: " + snakeScore, 10, 110);
  
  if (showPlusTen) {
    if (millis() - plusTenStartTime < 1000) {
      fill(0, 255, 0);
      textSize(24);
      text("+10", 246, 102);
    } 
    else {
      showPlusTen = false;
    }
    textSize(48);
  }
}

void keyPressed() {
  if (key == 'w') {
    snakeLength++;
  } 
  else if (key == ' ') {
    snakeScore += 10;
    startTime = millis() - snakeScore * 1000; 
    showPlusTen = true; 
    plusTenStartTime = millis(); 
  }
}
