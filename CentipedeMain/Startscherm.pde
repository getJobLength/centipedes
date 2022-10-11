final int STARTSCHERM = 0; 
PFont gm; 

int playerCount = 1; 

void createStart() {
  textFont(gm);
  textAlign(CENTER, CENTER);
  textSize(60); 
  fill(colorTheme[1]);
  text("Centipede", width/2, height/8);
  textSize(30);

  text("Aantal Spelers", width/2, height/3);
  createPlayerSelector();
  fill(colorTheme[1]);
  text("Aantal Bananen", width/2, height/3 + 50);
  createBananaSelector(); 

  createButton("Start nieuw spel", buttonX, buttonY + 200, buttonWidth, buttonHeight);
}



void createBananaSelector() {
  int sWidth = 30;
  int margin = 30; 
  stroke(colorTheme[2]);
  createButtonRow(6, margin, sWidth);
  for (int i = 1; i < 6; i++) {    
    //change color if bananacounter is the same as the i pos
    fill(colorTheme[2]);
    if (bananaCounter == i) {
      fill(colorTheme[4]);
    }
    
    text(i, width/3 + margin + sWidth, height/3 + 90);
    margin += sWidth;
  }
}
