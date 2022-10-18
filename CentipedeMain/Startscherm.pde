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

  fill(colorTheme[1]);
  text("Aantal Spelers", width/2, height/3);
  createPlayerSelector(); 

  fill(colorTheme[1]);
  text("Aantal Bananen", width/2, height/3 + 50);
  createBananaSelector(); 

  fill(colorTheme[1]);
  text("Grootte Speelveld", width/2, height/3 + 130);
  createPlayingFieldSelector();

  createButton("Start nieuw spel", buttonX, buttonY + 200, buttonWidth, buttonHeight);
}

void createPlayerSelector() {  
  text(playerCount, oneTriX + (triWidth*2), height/3);

  fill(colorTheme[2]);
  triangle(oneTriX, height/3, oneTriX + triWidth, height/3 - triHeight, oneTriX + triWidth, height/3 + triHeight);
  triangle(oneTriX + (triWidth*4), height/3, oneTriX + (triWidth*3), height/3 - triHeight, oneTriX + (triWidth*3), height/3 + triHeight);
}

void createBananaSelector() {
  int sWidth = 30;
  int margin = 30; 
  stroke(colorTheme[2]);
  createButtonRow(6, margin, sWidth, height/3 + 75);

  for (int i = 1; i < 6; i++) {    
    //change color if bananacounter is the same as the i pos
    fill(colorTheme[2]);
    if (bananaCounter == i + 19) {
      fill(colorTheme[4]);
    }
    textSize(15);
    text(i + 19, width/3 + margin + sWidth, height/3 + 90);
    margin += sWidth;
  }
}

void createPlayingFieldSelector() {  
  int sWidth = 30;
  int margin = 30;

  createButtonRow(6, 30, 30, height/3 + 155);

  for (int i = 0; i < playingField.length; i++) {
    fill(colorTheme[2]);
    textSize(10);
    
    //Correctie ivm vorige methodes
      if (fieldSize == i + 1) {
      fill(colorTheme[4]);
    }

    text(playingField[i][0] + "x" + playingField[i][1] , width/3 + margin + sWidth, height/3 + 170);
    margin += sWidth;
  }
}
