int buttonWidth = 750/2 - 150; 
int buttonHeight = 750/2 - 300;
int buttonX = 750/2 - (buttonWidth/2);
int buttonY = 750/2;

int triHeight = 10; 
int triWidth = 20; 
int oneTriX = 750/2 + 125;

void createButton(String text, int x, int y, int bWidth, int bHeight) {
  fill(colorTheme[3]);
  noStroke();  
  rect(x, y, bWidth, bHeight); 
  
  fill(colorTheme[4]);
  textAlign(CENTER,CENTER);
  textSize(20);
  text(text, x + bWidth/2, y + (buttonHeight/2) - 5);
}

void createSpelerSelector() {
  text(playerCount, oneTriX + (triWidth*2), height/3);
  
  fill(colorTheme[2]);
  triangle(oneTriX,height/3, oneTriX + triWidth,height/3 - triHeight, oneTriX + triWidth,height/3 + triHeight);
  triangle(oneTriX + (triWidth*4),height/3, oneTriX + (triWidth*3),height/3 - triHeight, oneTriX + (triWidth*3),height/3 + triHeight);
}

boolean mouseButtonCheck(int xMouse, int yMouse, int buttonX, int buttonY, int bWidth, int bHeight) {
  return (xMouse > buttonX && yMouse > buttonY && xMouse < buttonX + bWidth && yMouse < buttonY + bHeight); 
}
