class Arrow{
  
  float x, y, speedX, speedY, angleX, angleY, angle;
  float speed = 17;
  PImage arrow;
  double direction; //set the member variables for the Arrow class
  
  Arrow(float x, float y){
    this.x = x;
    this.y = y;
    this.setDirection();
    
    arrow = loadImage("arrow.png");
    arrow.resize(120,120); //define the constructor for the Arrow class
  }
  
  public void render(){
    image(arrow,x,y);
  }
  
  public void setDirection(){
    speedX = mouseX-x;
    speedY = mouseY-y;
    direction = Math.atan2(speedY, speedX);
  } //cause an arrow to shoot in the direction of the mouse cursor
  
  public void move(){
    x += speed*Math.cos(direction);
    y += speed*Math.sin(direction);
  } //cause an arrow to move at the speed given
  
  public void update(){
    render();
    move();
  }
  
  public boolean collision(Apple other){
    if(abs(this.x-other.x)<40 && abs(this.y-other.y)<40){
      return true;
    }
    return false;
  } //polymorphism: one method works for any Apple subclass (HealthyApples or WormApples)
  
  public boolean collision(Bird other){
    if(abs(this.x-other.x)<35 && abs(this.y-other.y)<35){
      return true;
    }
    return false;
  } //create collision mechanisms for the arrow with the WormApples, HealthyApples and Birds classes
    
  
  
}
