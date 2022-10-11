int bugSize = 30; 
int bugX = (int)random(200, 600) - bugSize;
int bugY = (int)random(200, 600) - bugSize;

void createCentipede(int x, int y) {
  //Maak centipede
  square(x, y, bugSize);
}

void moveCentipede() {
  //Maak dit nog even
}

boolean bugSquashed() {
  return (mouseX > bugX && mouseY > bugY && mouseX < bugX + bugSize && mouseY < bugY + bugSize);
}
