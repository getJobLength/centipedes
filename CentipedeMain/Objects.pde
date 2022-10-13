final int OBJECTSIZE = 25; 

int xObject = (int)random(xConMin, xConMax); 
int yObject = (int)random(yConMin, yConMax); 



void drawObject(int x, int y) {
    fill(0);
    square(x, y, OBJECTSIZE);
}
