final int SPELSCHERM = 1;  
int score = 0; 
int stage = 0;

int lastScore;

void createSpelscherm() {
  textFont(gm);
  textAlign(CENTER, CENTER);
  textSize(60); 
  fill(colorTheme[1]);
  text("Bug Squash", width/2, 30);
  textSize(30);
  text("Score: " + score, width/2, 100); 
  text("Stage: " + stage, width/2, height - 30);
  createButton("Stop", width/2 - (buttonWidth/2), height - buttonHeight - 50, buttonWidth, buttonHeight); 
  text("Verstreken tijd: " + (millis() - timerStart)/1000, 100, 30);
}
