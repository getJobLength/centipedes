int curScreen = 0; 
int timerStart = 0; 

int colorTheme[] = {#cdb4db, #ffc8dd, #ffafcc, #bde0fe, #a2d2ff};

int bananaCounter;

void setup() {
  size(750, 750); 
  gm = createFont("gotham-medium.otf", 128);
}

void draw() {

  background(colorTheme[0]);    

  if (curScreen == STARTSCHERM) {
    createStart();
  } else if (curScreen == SPELSCHERM) {

    createSpelscherm(); 

    createCentipede(bugX, bugY); 
    moveCentipede();
    if (bugX + bugSize >= width || bugX <= 0) {
      bugX = (int)random(200, 600) - bugSize;
      bugY = (int)random(200, 600) - bugSize;
    }
  } else if (curScreen == EINDSCHERM) {
    // als 30 seconden voorbij zijn laat eindscherm zien
  }
}


void mouseReleased() {
  
  //banana mouseclickcheck
  int sWidth = 30;
  int margin = 30; 
  for (int i = 1; i < 6; i++) {
     if (mouseButtonCheck(mouseX, mouseY, width/3 + margin + (sWidth/2), height/3 + 75, sWidth, sWidth)) {
        bananaCounter = i; 
        println(bananaCounter);
     }
     margin += sWidth;
  }
  
  // Button control. 
  if (mouseButtonCheck(mouseX, mouseY, buttonX, buttonY + 200, buttonWidth, buttonHeight)) {
    curScreen = SPELSCHERM;
    timerStart = millis();
  }

  //if (mouseButtonCheck(mouseX, mouseY, buttonX, buttonY + buttonHeight + 10, buttonWidth, buttonHeight)) {
  //  curScreen = SPELSCHERM;
  //  score = lastScore;
  //}

  if (mouseButtonCheck(mouseX, mouseY, width/2 - (buttonWidth/2), height - buttonHeight - 50, buttonWidth, buttonHeight)) {
    curScreen = STARTSCHERM; 
    lastScore = score; 
    score = 0;
  }

  // Arrows for playerCount. Decide how many players are playing. 
  if (mouseButtonCheck(mouseX, mouseY, oneTriX, height/3 - triHeight, triWidth, triHeight*2) && playerCount == 2) {
    playerCount = 1;
  }
  if (mouseButtonCheck(mouseX, mouseY, oneTriX + (triWidth*3), height/3 - triHeight, triWidth, triHeight*2) && playerCount == 1) {
    playerCount = 2;
  }
}
