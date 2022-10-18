final int OBJECTSIZE = 25; 

int bananaPos[][] = new int[bananaCounter][2];
int chameleonPos[][] = new int[bananaCounter/10][2]; 

void createBananas() { 
  for (int i = 0; i < bananaCounter - 1; i++) {
    bananaPos[i][0] = floor(random(1 , playingField[fieldSize - 1][0] - 1)); 
    bananaPos[i][1] = floor(random(playingField[fieldSize - 1][1])); 
    println("x: " + bananaPos[i][0] + "y: "+ bananaPos[i][1]);
  }
}

void createChameleons() {
  //draw 10% of bananaCounter
  float amnt = bananaCounter / 10;
  for (int i = 0; i < (int)amnt; i++) {
    chameleonPos[i][0] = floor(random(1 , playingField[fieldSize - 1][0])); 
    chameleonPos[i][1] = floor(random(playingField[fieldSize - 1][1])); 
    println("x: " + chameleonPos[i][0] + "y: "+ chameleonPos[i][1]);
  }
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
