class Arrow {
  float x, y;
  float speed = 17;
  float flightAngle;   // direction of travel (toward mouse)
  float drawAngle;     // arrow sprite rotation
  PImage arrow;

  Arrow(float x, float y, float flightAngle) {
    this.x = x;
    this.y = y;
    this.flightAngle = flightAngle;
    this.drawAngle = flightAngle + PI / 4;
    arrow = loadImage("arrow.png");
    arrow.resize(120, 120);
  }

  public void render() {
    pushMatrix();
    translate(x, y);
    rotate(drawAngle);
    image(arrow, 0, 0);
    popMatrix();
  }

  public void move() {
    x += speed * cos(flightAngle);
    y += speed * sin(flightAngle);
  }
  
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
