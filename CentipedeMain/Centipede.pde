int xPlayer = 800/2 - ((playingField[fieldSize - 1][0] * squareSize) /2 );
int yPlayer = 800 / 3 - squareSize; 

int centipedePos[][] = {
  {xPlayer, yPlayer}, 
  {200, yPlayer + 1 * squareSize}, 
  {200, yPlayer + 2 * squareSize}, 
  {200, yPlayer + 3 * squareSize}, 
  {200, yPlayer + 4 * squareSize}, 
  {200, yPlayer + 5 * squareSize},
  {200, yPlayer + 6 * squareSize}
}; 

int testPosX = centipedePos[0][0]; 
int testPosY = centipedePos[0][1];

int xConMin = 800/2 - ((playingField[fieldSize - 1][0] * squareSize) /2) - squareSize;
int xConMax = xConMin + (playingField[fieldSize - 1][0] * squareSize) + squareSize;
int yConMin = 800/3 - (squareSize*3);
int yConMax = yConMin + (playingField[fieldSize - 1][1] * squareSize) + squareSize;

void drawCentipede() {
  drawCentipedeHead(centipedePos[0][0], centipedePos[0][1]);
  for (int i = 1; i < centipedePos.length; i++) {
    drawCentipedeBody(centipedePos[i][0], centipedePos[i][1]);
  }
}

void drawCentipedeHead(int x, int y) {
  //Maak centipede
  fill(colorTheme[3]);
  square(x, y, squareSize);
}

void drawCentipedeBody(int x, int y) {
  stroke(colorTheme[3]);
  fill(colorTheme[4]);
  square(x, y, squareSize);
}

void cycleThroughArray() {
  for (int i = centipedePos.length - 2; i >= 0; i--) {
    centipedePos[i+1][0] = centipedePos[i][0];
    centipedePos[i+1][1] = centipedePos[i][1];
  }
}

boolean conCentipede() {
 return testPosX > xConMin && testPosX < xConMax && testPosY > yConMin && testPosY < yConMax;
}    

boolean collisionDetection(int testPosX, int testPosY) {
  for (int i = 1; i < centipedePos.length; i++) {
    if (testPosX == centipedePos[i][0] && testPosY == centipedePos[i][1]) {
      return true;
    }
  }
  return false;
}

void moveCentipede() {
  switch(keyCode) {
  case RIGHT:
    testPosX = centipedePos[0][0] + squareSize;
    if (!collisionDetection(testPosX, centipedePos[0][1]) && conCentipede()) {
      cycleThroughArray();
      centipedePos[0][0] += squareSize;
      testPosX = centipedePos[0][0];
    }
    break;
  case LEFT: 
    testPosX = centipedePos[0][0] - squareSize;
    if (!collisionDetection(testPosX, centipedePos[0][1]) && conCentipede()) {
      cycleThroughArray();
      centipedePos[0][0] -= squareSize;
      testPosX = centipedePos[0][0];
    }    
    break;
  case UP:  
    testPosY = centipedePos[0][1] - squareSize;
    if (!collisionDetection(centipedePos[0][0], testPosY) && conCentipede()) {
      cycleThroughArray();
      centipedePos[0][1] -= squareSize;
      testPosY = centipedePos[0][1];
    } 
    break;
  case DOWN: 
    testPosY = centipedePos[0][1] + squareSize;
    if (!collisionDetection(centipedePos[0][0], testPosY) && conCentipede()) {
      cycleThroughArray();
      centipedePos[0][1] += squareSize;
      testPosY = centipedePos[0][1];
    }
    break;
  }
}
