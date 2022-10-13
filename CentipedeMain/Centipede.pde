int headPartSize = 25;

int xPlayer = 800/2 - ((playingField[fieldSize - 1][0] * headPartSize) /2 );
int yPlayer = 800 / 3 - headPartSize; 

int testPosX; 
int testPosY; 

int centipedePos[][] = {
  {xPlayer, yPlayer}, 
  {200, yPlayer + 1 * headPartSize}, 
  {200, yPlayer + 2 * headPartSize}, 
  {200, yPlayer + 3 * headPartSize}, 
  {200, yPlayer + 4 * headPartSize}, 
  {200, yPlayer + 5 * headPartSize}
}; 

void drawCentipede() {
  drawCentipedeHead(centipedePos[0][0], centipedePos[0][1]);
  for (int i = 1; i < centipedePos.length; i++) {
    drawCentipedeBody(centipedePos[i][0], centipedePos[i][1]);
  }
}

void drawCentipedeHead(int x, int y) {
  //Maak centipede
  fill(colorTheme[3]);
  square(x, y, headPartSize);
}

void drawCentipedeBody(int x, int y) {
  stroke(colorTheme[3]);
  fill(colorTheme[4]);
  square(x, y, headPartSize);
}

void cycleThroughArray() {
  for (int i = centipedePos.length - 2; i >= 0; i--) {
    centipedePos[i+1][0] = centipedePos[i][0];
    centipedePos[i+1][1] = centipedePos[i][1];
  }
}

void constrainCentipede() {
  centipedePos[0][0] = constrain(centipedePos[0][0], width/2 - ((playingField[fieldSize - 1][0] * squareSize) /2 ), width/2 - ((playingField[fieldSize - 1][0] * squareSize)/2) + playingField[fieldSize - 1][0] * squareSize - squareSize); 
  centipedePos[0][1] = constrain(centipedePos[0][1], height/3 - (squareSize*2), height/3 - (squareSize*2) + playingField[fieldSize - 1][1] * squareSize - squareSize);
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
    if (!collisionDetection(testPosX, centipedePos[0][1])) {
      cycleThroughArray();
      centipedePos[0][0] += squareSize;
    }
    break;
  case LEFT: 
    testPosX = centipedePos[0][0] - squareSize;
    if (!collisionDetection(testPosX, centipedePos[0][1])) {
      cycleThroughArray();
      centipedePos[0][0] -= squareSize;
    }    
    break;
  case UP:  
    testPosY = centipedePos[0][1] - squareSize;
    if (!collisionDetection(centipedePos[0][0], testPosY)) {
      cycleThroughArray();
      centipedePos[0][1] -= squareSize;
    } 
    break;
  case DOWN: 
    testPosY = centipedePos[0][1] + squareSize;
    if (!collisionDetection(centipedePos[0][0], testPosY)) {
      cycleThroughArray();
      centipedePos[0][1] += squareSize;
    }
    break;
  }
}
