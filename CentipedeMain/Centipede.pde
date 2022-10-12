int headPartSize = 25;
int bodyPartSize = headPartSize;
int xPlayer = 800/2 - ((playingField[fieldSize - 1][0] * headPartSize) /2 );
int yPlayer = 800 / 3 - headPartSize; 


int snakePos[][] = {
{xPlayer, yPlayer},
{xPlayer, yPlayer + bodyPartSize},
{xPlayer, yPlayer + bodyPartSize*2},
{xPlayer, yPlayer + bodyPartSize*3},
{xPlayer, yPlayer + bodyPartSize*4},
{xPlayer, yPlayer + bodyPartSize*5}

}; 


void createCentipedeHead(int x, int y) {
  //Maak centipede
  fill(colorTheme[3]);
  square(x, y, headPartSize);
  createCentipedeBody();
}

void createCentipedeBody() {

  for (int i = 0; i < snakePos.length; i++) {
    stroke(colorTheme[3]);
    fill(colorTheme[4]);
    square(snakePos[i][0], snakePos[i][1], bodyPartSize);
    if (i >= 1) {
      
      println("reached" + i);
    snakePos[i][0] = snakePos[i - 1][0]; 
    snakePos[i][1] = snakePos[i - 1][1];
    }
    
  }
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
