PImage nonPlayBackground, playBackground, basket, cursorCross, bowAndArrow, slicedApple;
String[] HighScore;
int score = 0;
int realHighScore;
int timer = 0;
int timerTwo = 0;
States gameState = States.STARTMENU; //initialises the constant values to be used in the game

ArrayList<Apple>apples = new ArrayList<Apple>(); //polymorphism: holds HealthyApples and WormApples
ArrayList<Arrow>arrows = new ArrayList<Arrow>();
ArrayList<Bird>birds = new ArrayList<Bird>();
ArrayList<SlicedApples>slicedApples = new ArrayList<SlicedApples>(); //initialises the ArrayLists of images to use during gameplay

float bowX() {
  return width / 9.0f;
}

float bowY() {
  return height - 100;
}

float aimTowardMouse() {
  return atan2(mouseY - bowY(), mouseX - bowX());
}

// make the bow sprite point at the cursor
final float BOW_SPRITE_OFFSET = PI / 4;

float bowDrawAngle() {
  return aimTowardMouse() + BOW_SPRITE_OFFSET;
}

public void setup() {
  size(1000, 700); //sets the screen size

  nonPlayBackground = loadImage("nonplaybackground.png");
  nonPlayBackground.resize(width, height); //displays the given PImage at the given x and y positions
  
  playBackground = loadImage("woodbackground.jpeg");
  playBackground.resize(width, height);

  basket = loadImage("basket.png");
  basket.resize(180, 100);

  bowAndArrow = loadImage("bowandarrow.png");
  bowAndArrow.resize(250, 250);

  cursorCross = loadImage("cursorcross.png");
  cursorCross.resize(75, 75);
  
  HighScore = loadStrings("HighScore.txt"); //saves the HighScore text file to the HighScore String array variable
  
}



public void draw() {

  imageMode(CENTER); //causes all the PImage positions to be set from the centre rather than the top left corner

  if (gameState == States.STARTMENU) {
    loadNonPlayBackground();
    textSize(40);
    text("Welcome to Shoot The Apples!", width/4, height/6); //prints the given strings at the given x and y positions
    text("Left mouse click to begin.", width/3.5, height/1.15);
    textSize(35);
    text("Press the mouse to fire an arrow and shoot the worm apples.", width/16, height/3);
    text("See how many healthy apples you can get in the basket.", width/10, height/2);
    textSize(29);
    text("If you shoot a healthy apple or a bird, or a worm apple lands in the basket, it's", width/30, height/1.5);
    text("game over.", width/2.4, height/1.4);
  }
  
  
  else if (gameState == States.PLAY) {
    loadBackground(); //calls the appropriate subroutine defined outside of void setup() and void draw()
    pushMatrix();
    translate(bowX(), bowY());
    rotate(bowDrawAngle());
    image(bowAndArrow, 0, 0);
    popMatrix();

    image(basket, width/2, height-75);
    
    
    for (int i = 0; i < apples.size(); i++) {
      apples.get(i).update(); //polymorphism: update() runs for whichever subclass is in the list
    }
    
    
    for(int w=0; w<birds.size(); w++){
      birds.get(w).update();
      
      if(birds.get(w).x > width){
        birds.remove(birds.get(w)); //remove bird if it disappears off the right of the screen
      }
    }


    for (int i=0; i<arrows.size(); i++) {
      arrows.get(i).update();
      
      if(arrows.get(i).x>width || arrows.get(i).x<0 || arrows.get(i).y>height || arrows.get(i).y<0){
        arrows.remove(arrows.get(i));
      }
    }
    
    
    for (int z=0; z<slicedApples.size(); z++) {
      slicedApples.get(z).render();
      
      timerTwo++;
      if(timerTwo > 10){
          slicedApples.remove(slicedApples.get(z));
          timerTwo = 0;
      }
    } //display the collision animation sequence until timerTwo reaches 10, and then reset timerTwo and stop showing the collision animation sequence
    
    
    makeNewBirds();


    makeNewApples(); //generate a healthy or worm apple with equal random chance (not alternating)
    
    
    displayInGameText();


    image(cursorCross, mouseX, mouseY);


    
    incrementScore();
    destroyWormApples();
    gameOver();
    updateHighScore();

    timer++;
 
  }
  
  
  
  else if(gameState == States.HEALTHY_APPLE_SHOT){
    displayGameOverScreen();
    text("A healthy apple was shot.", width/14, height/3);
  }
  
  
  else if(gameState == States.WORM_APPLE_REACHED_BASKET){
    displayGameOverScreen();
    text("A worm apple reached the basket.", width/14, height/3);
  }
  
  else if(gameState == States.BIRD_SHOT){
    displayGameOverScreen();
    text("A bird was shot.", width/14, height/3);
  }
}


public void displayInGameText(){
  realHighScore = Integer.parseInt(HighScore[0]); //convert the HighScore String array value at index 0 to an integer and store it in the realHighScore variable
  textSize(50);
  text("Score: ", 25, 60);
  text(score, 165, 62);
  text("High score: ", 25, 120);
  text(realHighScore, 265, 122);
}


public void loadBackground() {
  image(playBackground, width/2, height/2);
}


public void loadNonPlayBackground() {
  image(nonPlayBackground, width/2, height/2);
}

public void resetValues(){
  apples = new ArrayList<>();
  arrows = new ArrayList<>();
  birds = new ArrayList<>();
  timer = 0;
  score = 0;
}


public void makeNewApples() {
  if (timer % 75 == 0) { //same spawn interval for both types
    if (random(2) < 1) { //50% healthy, 50% worm; independent each spawn (not alternating)
      apples.add(new HealthyApples((int)random(0, width-100), 0));
    } else {
      apples.add(new WormApples((int)random(0, width-100), 0));
    }
  }
}


public void makeNewBirds(){
  if(timer%180 == 0){
    birds.add(new Bird(0, (int)random(50, height-300)));
  }
}


public void incrementScore() {
  for (int i = 0; i < apples.size(); i++) {
    Apple a = apples.get(i);
    if (!a.isWorm() && !(a.isOffScreen) && a.y > height-75) {
      score += 1;
      a.isOffScreen = true;
    }
    
    if (a.isOffScreen) {
      apples.remove(a);
    }
  }
}



public void gameOver() {
  for (int i = 0; i < apples.size(); i++) {
    Apple a = apples.get(i);
    if (a.isWorm() && a.y > height-75) {
      gameState = States.WORM_APPLE_REACHED_BASKET;
    }
  }
  
  for (int i = 0; i < arrows.size(); i++) {
    for (int j = 0; j < apples.size(); j++) {
      Apple a = apples.get(j);
      if (!a.isWorm() && arrows.get(i).collision(a)) {
        gameState = States.HEALTHY_APPLE_SHOT;
      }
    }
  }
  
  for (int i = 0; i < arrows.size(); i++) {
    for (int r = 0; r < birds.size(); r++) {
      if (arrows.get(i).collision(birds.get(r))) {
        gameState = States.BIRD_SHOT;
      }
    }
  }
}


public void destroyWormApples(){
  for (int k = 0; k < apples.size(); k++){
    Apple a = apples.get(k);
    if (!a.isWorm()) {
      continue;
    }
    for (int t = 0; t < arrows.size(); t++) {
      if (arrows.get(t).collision(a)){
        slicedApples.add(new SlicedApples(a.x, a.y));
        apples.remove(a);
        arrows.remove(arrows.get(t));
        return;
      }
    }
  }
}


public void updateHighScore(){
  if(parseInt(HighScore[0])<score){
    HighScore[0] = str(score);
    saveStrings("HighScore.txt", HighScore);
  }
} //if the player's score is greater than the saved high score, update the high score with the player's score


public void displayGameOverScreen(){
  loadNonPlayBackground();
  if(score == 1){
    text("1 healthy apple reached the basket.", width/14, height/2);
  }
  else{
    text(score + " healthy apples reached the basket.", width/14, height/2);
  }
  text("Left mouse click to replay.", width/14, height/1.5);
}


public void mouseClicked() {
  if(gameState == States.STARTMENU || gameState == States.WORM_APPLE_REACHED_BASKET || gameState == States.HEALTHY_APPLE_SHOT || gameState == States.BIRD_SHOT){
    gameState = States.PLAY;
    resetValues();
  }
  else if (gameState == States.PLAY) {
    arrows.add(new Arrow(bowX(), bowY(), aimTowardMouse()));
  }
}
