class Bird {
  
  int x, y;
  int frames = 0; //set the member variables for the Bird class
  
  PImage[] bird = new PImage[4]; //create an animation sequence for the birds using 4 image frames
  
  Bird(int x, int y){
    this.x = x;
    this.y = y;
    
    for(int i=0; i<4; i++){
      bird[i] = loadImage("bird" + (i+1) + ".png");
      bird[i].resize(250,250); //define the constructor for the Bird class
    }
  }


  public void animate(){
    if(frames < 5){
      image(bird[0], x, y);
    }
    else if(frames < 10){
      image(bird[1], x, y);
    }
    else if(frames < 15){
      image(bird[2], x, y);
    }
    else if(frames < 20){
      image(bird[3], x, y);
    }
    else{
      image(bird[3], x, y);
      frames = 0;
    }
    frames++;
  }
  
  
  public void move(){
    x = x + 6;
  }
  
  
  public void update(){
    animate();
    move();
  }
}
