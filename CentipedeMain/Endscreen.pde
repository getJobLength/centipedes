final int ENDSCREEN = 3; 

void drawEndscreen() {
  // laat score zien
  // laat eindtekst zien
  // maak knop met begin opnieuw
  textFont(gm);
  textAlign(CENTER, CENTER);
  textSize(60); 
  fill(colorTheme[1]);
  text("Centipede", width/2, height/15);
  
  textSize(20);
  text("Eindscore: " + scoreP1, width/2, height/4); 
  drawRestartButton();
}

void drawRestartButton() {
  createButton("Restart", width/2 - buttonWidth/2, height/2, buttonWidth, buttonHeight);
}
