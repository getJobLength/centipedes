int bodyPartSize = 25; 
int xPlayer = 800/2 - ((playingField[fieldSize - 1][0] * bodyPartSize) /2 );
int yPlayer = 800 / 3 - bodyPartSize; 


void createCentipedeHead(int x, int y) {
  //Maak centipede
  fill(colorTheme[3]);
  square(x, y, bodyPartSize);
}

void moveCentipede() {
  switch(keyCode) {
  case RIGHT:
    xPlayer += squareSize;  
    break;
  case LEFT: 
    xPlayer -= squareSize; 
    break;
  case UP:  
    yPlayer -= squareSize; 
    break;
  case DOWN: 
    yPlayer += squareSize; 
    break;
  }
}
