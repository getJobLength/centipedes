final int OBJECTSIZE = 25; 

void createObject(int x, int y, int amount) {
  for (int i = 0; i < amount - 1; i ++) {
    fill(0);
    square(x, y, OBJECTSIZE);
  }
}
