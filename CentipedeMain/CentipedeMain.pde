boolean devMode = false; 
int squareSize = 25;
int curScreen = 0; 
int timerStart = 0; 

int colorTheme[] = {#cdb4db, #ffc8dd, #ffafcc, #bde0fe, #a2d2ff};
int playingField[][] = {
  {16, 8}, 
  {20, 10}, 
  {24, 12}, 
  {28, 14}, 
  {32, 16}
};

int bananaCounter = 20;

int scoreP1;
int scoreP2; 

int fieldSize = 1; 

void setup() {
  size(800, 800); 
  gm = createFont("gotham-medium.otf", 128);
}

void draw() {
  background(colorTheme[0]);    

  if (curScreen == STARTSCREEN) {
    createStart();
  } else if (curScreen == PLAYINGSCREEN) {
    drawPlayingscreen(); 
    drawCentipede();

    if (devMode) {
      println("Player = x: " + centipedePos[0][0] + ",y: " + centipedePos[0][1]);
      bananaHit();
      chameleonHit();
    }

    if (centipedePos.length == 1 || scoreP1 == bananaCounter * 10) {
      curScreen = ENDSCREEN;
    }
  } else if (curScreen == ENDSCREEN) {
    drawEndscreen();
  }
}


void mouseReleased() {
  int sWidth = 30;
  int margin = 30;
  for (int i = 1; i < 6; i++) {
    //banana mouseclickcheck 
    if (mouseButtonCheck(mouseX, mouseY, width/3 + margin + (sWidth/2), height/3 + 75, sWidth, sWidth)) {
      bananaCounter = i + 19; 
      println(bananaCounter);
    }
    // Check for field size option
    if (mouseButtonCheck(mouseX, mouseY, width/3 + margin + (sWidth/2), height/3 + 155, sWidth, sWidth)) {   
      fieldSize = i;
      println(fieldSize);
    }
    margin += sWidth;
  }

  // Arrows for playerCount. Decide how many players are playing. 
  if (mouseButtonCheck(mouseX, mouseY, oneTriX, height/3 - triHeight, triWidth, triHeight*2) && playerCount == 2) {
    playerCount = 1;
  }
  if (mouseButtonCheck(mouseX, mouseY, oneTriX + (triWidth*3), height/3 - triHeight, triWidth, triHeight*2) && playerCount == 1) {
    playerCount = 2;
  }

  // Start button. 
  if (mouseButtonCheck(mouseX, mouseY, buttonX, buttonY + 200, buttonWidth, buttonHeight)) {
    curScreen = PLAYINGSCREEN;
    createBananas();
    createChameleons();
    timerStart = millis();
  }

  // Stop button. 
  if (mouseButtonCheck(mouseX, mouseY, width/2 - (buttonWidth/2), height - buttonHeight - 50, buttonWidth, buttonHeight)) {
    curScreen = STARTSCREEN; 
    //lastScore = score; 
    //score = 0;
  }

  // Restart button. 
  if (mouseButtonCheck(mouseX, mouseY, width/2 - (buttonWidth/2), height/2, buttonWidth, buttonHeight)) {
    scoreP1 = 0; 
    curScreen = STARTSCREEN;
  }
}

void keyPressed() {
  moveCentipede();

  if (bananaHit()) {
    scoreP1 += 10;
  }
  if (chameleonHit()) {
    centipedePos = shortenCentipede(centipedePos);
  }
}
