final int OBJECTSIZE = 25; 

int bananaPos[][] = new int[bananaCounter][2];
int chameleonPos[][] = new int[bananaCounter/10][2]; 

int chameleonCounter = floor(bananaCounter/10); 
int chameleonPlaced = 0; 
int bananaPlaced = 0; 

//void createBananas() { 
//  for (int i = 0; i < bananaCounter - 1; i++) {
//    bananaPos[i][0] = floor(random(1 , playingField[fieldSize - 1][0] - 1)); 
//    bananaPos[i][1] = floor(random(playingField[fieldSize - 1][1])); 
//    println("x: " + bananaPos[i][0] + "y: "+ bananaPos[i][1]);
//  }
//}

//void createChameleons() {
//  //draw 10% of bananaCounter
//  float amnt = bananaCounter / 10;
//  for (int i = 0; i < (int)amnt; i++) {
//    chameleonPos[i][0] = floor(random(1 , playingField[fieldSize - 1][0])); 
//    chameleonPos[i][1] = floor(random(playingField[fieldSize - 1][1])); 
//    println("x: " + chameleonPos[i][0] + "y: "+ chameleonPos[i][1]);
//  }
//}

void createBananas() {
  while (bananaPlaced < bananaCounter) {
    int x = floor(random(1 , playingField[fieldSize - 1][0])); 
    int y = floor(random(playingField[fieldSize - 1][1]));
    if (posFree(x,y)) {
      bananaPos[bananaPlaced][0] = x;
      bananaPos[bananaPlaced][1] = y;
      println("Banana = x: " + x + ",y: " + y);
      bananaPlaced++; 
    }
  }
}

void createChameleons() {
  while (chameleonPlaced < chameleonCounter) {
    int x = floor(random(1 , playingField[fieldSize - 1][0])); 
    int y = floor(random(playingField[fieldSize - 1][1]));
    if (posFree(x,y)) {
      chameleonPos[chameleonPlaced][0] = x;
      chameleonPos[chameleonPlaced][1] = y;
      println("Chameleon = x: " + x + ",y: " + y);
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

boolean chameleonHit() {
  int xChameleon;
  int yChameleon; 
  for (int i = 0; i < chameleonPos.length; i++) {
    //offset x
    xChameleon = width/2 - ((playingField[fieldSize - 1][0] * squareSize) /2 ) + chameleonPos[i][0] * squareSize; 
    //offset y
    yChameleon = height/3 - (squareSize*2) + chameleonPos[i][1] * squareSize;
      if (xPlayer == xChameleon && yPlayer == yChameleon) {
        return true; 
      }
  }
  return false; 
}
