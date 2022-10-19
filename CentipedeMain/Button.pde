int buttonWidth = 800/2 - 150; 
int buttonHeight = 800/2 - 300;
int buttonX = 800/2 - (buttonWidth/2);
int buttonY = 800/2;

int triHeight = 10; 
int triWidth = 20; 
int oneTriX = 800/2 + 125;

void createButton(String text, int x, int y, int bWidth, int bHeight) {
  fill(colorTheme[3]);
  noStroke();  
  rect(x, y, bWidth, bHeight); 
  
  fill(colorTheme[4]);
  textAlign(CENTER,CENTER);
  textSize(20);
  text(text, x + bWidth/2, y + (buttonHeight/2) - 5);
}

void createButtonRow(int rowAmnt, int margin, int sWidth, int y) {
  stroke(colorTheme[2]);
  for (int i = 1; i < rowAmnt; i++) {
    fill(colorTheme[1]);
    square(width/3 + margin + (sWidth/2), y, sWidth);
    margin += sWidth;
  }
}

boolean mouseButtonCheck(int xMouse, int yMouse, int buttonX, int buttonY, int bWidth, int bHeight) {
  return (xMouse > buttonX && yMouse > buttonY && xMouse < buttonX + bWidth && yMouse < buttonY + bHeight); 
}
