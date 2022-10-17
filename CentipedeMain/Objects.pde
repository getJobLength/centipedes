final int OBJECTSIZE = 25; 

int xObject = (int)random(xConMin + OBJECTSIZE, xConMax - OBJECTSIZE); 
int yObject = (int)random(yConMin + OBJECTSIZE, yConMax - OBJECTSIZE); 



void drawObject(int x, int y) {
  fill(0);
  square(x, y, OBJECTSIZE);
}

void createBananas(int bananaCounter) { 
  for (int i = 0; i < bananaCounter; i++) {
    drawObject(xObject, yObject);
  }
}

void createChameleons() {
  //draw 10% of bananaCounter
  float amnt = bananaCounter / 10;
  for (int i = 0; i < (int)amnt; i++) {
    drawObject(xObject, yObject);
  }
}
