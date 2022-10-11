final int SPELSCHERM = 1;  
int score = 0; 
int stage = 0;

int lastScore;

int tileWidth = 750/20; 

void createSpelscherm() {
  textFont(gm);
  textAlign(CENTER, CENTER);
  textSize(60); 
  fill(colorTheme[1]);
  text("Centipede", width/2, 30);
  textSize(30);
  text("Score: " + score, width/2, 100); 
  
  createPlayingGrid();
  
  createButton("Stop", width/2 - (buttonWidth/2), height - buttonHeight - 50, buttonWidth, buttonHeight); 
  text("Verstreken tijd: " + (millis() - timerStart)/1000, 100, 30);
}

void createPlayingGrid() {
  fill(255);
  stroke(0);
  int squareSize = 25;
  int squareX = 10 + squareSize;
  int squareY = height/3 ;
 

  for (int i = 0; i < playingField[fieldSize - 1][1]; i++) {
    for (int j = 0; j < playingField[fieldSize - 1][0]; j++) {
      square(squareX, squareY, squareSize);
      squareX+=squareSize;
    }
    squareX= 10 + squareSize;
    squareY+=squareSize;
  }
}
