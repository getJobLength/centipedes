int curScreen = 1; 
int timerStart = 0; 

int colorTheme[] = {#cdb4db, #ffc8dd, #ffafcc, #bde0fe, #a2d2ff};
int playingField[][] = {
  {16, 8}, 
  {20, 10}, 
  {24, 12}, 
  {28, 14}, 
  {32, 16}

};

int bananaCounter;
int scoreP1;
int scoreP2; 

//PAS DIT AAN! PUUR VOOR TESTING PURPOSES
int fieldSize = 1; 

void setup() {
  size(800, 800); 
  gm = createFont("gotham-medium.otf", 128);
  println(800/2 - ((playingField[fieldSize - 1][0] * headPartSize) /2 ));
}

void draw() {
  background(colorTheme[0]);    

  if (curScreen == STARTSCHERM) {
    createStart();
  } else if (curScreen == SPELSCHERM) {
    drawSpelscherm();
    constrainCentipede(); 
    drawCentipede();
    
    
  } else if (curScreen == EINDSCHERM) {
    // als 30 seconden voorbij zijn laat eindscherm zien
  }
}


void mouseReleased() {
  int sWidth = 30;
  int margin = 30;
  for (int i = 1; i < 6; i++) {
    //banana mouseclickcheck 
    if (mouseButtonCheck(mouseX, mouseY, width/3 + margin + (sWidth/2), height/3 + 75, sWidth, sWidth)) {
      bananaCounter = i; 
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
    curScreen = SPELSCHERM;
    timerStart = millis();
  }

  // Stop button. 
  if (mouseButtonCheck(mouseX, mouseY, width/2 - (buttonWidth/2), height - buttonHeight - 50, buttonWidth, buttonHeight)) {
    curScreen = STARTSCHERM; 
    //lastScore = score; 
    //score = 0;
  }
}

void keyPressed() {
  moveCentipede();
}
