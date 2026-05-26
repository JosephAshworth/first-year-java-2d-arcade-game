abstract class Apple{ //creates an abstract Apple class (objects cannot be instantiated from this class name)
  
  int x, y; 
  int frames = 0;
  boolean isOffScreen = false; //set the member variables for the Apple class
  
  PImage[] apple = new PImage[4]; //create an animation sequence for the apples using 4 image frames
  
  Apple(int x, int y){
    this.x = x;
    this.y = y;
    loadImages(); //polymorphism: calls HealthyApples.loadImages() or WormApples.loadImages() at runtime
  }
  
  abstract void loadImages(); //each subclass loads its own sprites
  abstract boolean isWorm(); //each subclass identifies itself for game rules without separate lists
  
  private void animate(){
    if(frames < 10){
      image(apple[0],x,y);
    }
    else if(frames < 20){
      image(apple[1],x,y);
    }
    else if(frames < 30){
      image(apple[2],x,y);
    }
    else if(frames < 40){
      image(apple[3],x,y);
    }
    else{
      image(apple[3],x,y);
      frames = 0;
    }
    frames++;
  }
  
  private void move(){
    y = y + 2;
  }
  
  
  protected boolean isToLeftOfBasket(){
    if(x<width/2){
      return true;
    }
    return false;
  }
  
  protected boolean isToRightOfBasket(){
    if(x>width/2){
      return true;
    }
    return false;
  }
  
  protected void driftTowardBasket(){
    if (isToLeftOfBasket()) {
      x = x + 2;
    } else if (isToRightOfBasket()) {
      x = x - 2;
    }
  } //adjusts the x positions of the different apples to align with the basket
  
  
  public void update(){
    animate();
    move();
    driftTowardBasket();
  } //shared behaviour for all apples; subclasses do not need to re-define it
}