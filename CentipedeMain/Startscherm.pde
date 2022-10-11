final int STARTSCHERM = 0; 
PFont gm; 

int playerCount = 1; 


void createStart() {
  textFont(gm);
  textAlign(CENTER,CENTER);
  textSize(60); 
  fill(colorTheme[1]);
  text("Centipede", width/2, height/8);
  textSize(30);
  
  text("Aantal Spelers", width/2, height/3);
  createSpelerSelector();
  fill(colorTheme[1]);
  text("Aantal Bananen", width/2, height/3 + 50);
  createBananaSelector(); 
  
  createButton("Start nieuw spel",buttonX, buttonY + 200, buttonWidth, buttonHeight); 
  
}



void createBananaSelector() {
  int sWidth = 30;
  int margin = 30; 
  for (int i = 0; i < 6; i++) {
    fill(colorTheme[1]);
    if (mouseButtonCheck(mouseX, mouseY, width/3 + margin, height/3 + 75, sWidth, sWidth)) {
     fill(colorTheme[4]);
    }
    stroke(colorTheme[2]);
    square(width/3 + margin, height/3 + 75, sWidth);
    //asjdhfadfj
    //asdfjadfj
    margin += sWidth; 
    fill(colorTheme[2]); 
    text(i, width/3 - 13 + margin, height/3 + 90);
  }

}
