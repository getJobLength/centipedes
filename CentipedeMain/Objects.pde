final int OBJECTSIZE = 25; 

int bananaPos[][] = new int[bananaCounter][2];
int chameleonPos[][] = new int[bananaCounter/10][2]; 

int chameleonCounter = floor(bananaCounter/10); 
int chameleonPlaced = 0; 
int bananaPlaced = 0; 

void createBananas() {
  while (bananaPlaced < bananaCounter) {
    int x = floor(random(1, playingField[fieldSize - 1][0])); 
    int y = floor(random(playingField[fieldSize - 1][1]));
    if (posFree(x, y)) {
      bananaPos[bananaPlaced][0] = x;
      bananaPos[bananaPlaced][1] = y;
      bananaPlaced++;
    }
  }
}

void createChameleons() {
  while (chameleonPlaced < chameleonCounter) {
    int x = floor(random(1, playingField[fieldSize - 1][0])); 
    int y = floor(random(playingField[fieldSize - 1][1]));
    if (posFree(x, y)) {
      chameleonPos[chameleonPlaced][0] = x;
      chameleonPos[chameleonPlaced][1] = y;
      chameleonPlaced++;
    }
  }
}

boolean posFree(int x, int y) {
  for (int i = 0; i < chameleonCounter; i++) {
    if (chameleonPos[i][0] == x && chameleonPos[i][1] == y) {
      return false;
    }
  }
  for (int i = 0; i < bananaCounter; i++) {
    if (bananaPos[i][0] == x && bananaPos[i][1] == y) {
      return false;
    }
  }
  return true;
}

boolean bananaHit() {
  int xBanana;
  int yBanana; 
  for (int i = 0; i < bananaPos.length; i++) {
    //offset x
    xBanana = width/2 - ((playingField[fieldSize - 1][0] * squareSize) /2 ) + bananaPos[i][0] * squareSize; 
    //offset y
    yBanana = height/3 - (squareSize*2) + bananaPos[i][1] * squareSize;

    if (devMode) {
      fill(255, 255, 0);
      square(xBanana, yBanana, squareSize);
      println("Banana = x: " + xBanana + ",y: " + yBanana);
    }

    if (centipedePos[0][0] == xBanana && centipedePos[0][1] == yBanana) { 
      bananaPos[i][0] = -1; 
      bananaPos[i][1] = -1; 
      return true;
    }
  }
  return false;
}

boolean chameleonHit() {
  int xChameleon;
  int yChameleon; 
  for (int i = 0; i < chameleonPos.length; i++) {
    //offset x
    xChameleon = width/2 - ((playingField[fieldSize - 1][0] * squareSize) /2 ) + chameleonPos[i][0] * squareSize; 
    //offset y
    yChameleon = height/3 - (squareSize*2) + chameleonPos[i][1] * squareSize;

    if (devMode) {
      fill(0, 255, 0);
      square(xChameleon, yChameleon, squareSize);
      println("Chameleon = x: " + xChameleon + ",y: " + yChameleon);
    }
    if (centipedePos[0][0] == xChameleon && centipedePos[0][1] == yChameleon) {
      return true;
    }
  }
  return false;
}
