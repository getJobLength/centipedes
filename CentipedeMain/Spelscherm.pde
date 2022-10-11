final int SPELSCHERM = 1;  
int score = 0; 
int stage = 0;

int lastScore;

void createSpelscherm() {
  textFont(gm);
  textAlign(CENTER, CENTER);
  textSize(60); 
  fill(colorTheme[1]);
  text("Centipede", width/2, height/15);
  
  textSize(20);
  text("Score speler 1: " + scoreP1, width/5, height/7); 
  text("Score speler 2: " + scoreP2, width - width/5, height/7); 
  
  createPlayingGrid();
  
  createButton("Stop", width/2 - (buttonWidth/2), height - buttonHeight - 50, buttonWidth, buttonHeight); 
  text("Verstreken tijd: " + (millis() - timerStart)/1000, width/2, height/5);
}

void createPlayingGrid() {
  fill(255);
  stroke(0);
  int squareSize = 25;
  int squareX = width/2 - ((playingField[fieldSize - 1][0] * squareSize) /2 );
  int squareY = height/3 - (squareSize*2);
 

  for (int i = 0; i < playingField[fieldSize - 1][1]; i++) {
    for (int j = 0; j < playingField[fieldSize - 1][0]; j++) {
      square(squareX, squareY, squareSize);
      squareX+=squareSize;
    }
    squareX= width/2 - ((playingField[fieldSize - 1][0] * squareSize) /2 );
    squareY+=squareSize;
  }
}
