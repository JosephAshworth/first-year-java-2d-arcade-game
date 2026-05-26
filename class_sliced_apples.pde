class SlicedApples{
  
  int x, y; //set the member variables for the SlicedApples class
  
  SlicedApples(int x, int y){
    this.x = x;
    this.y = y;
    
    slicedApple = loadImage("slicedapple.png");
    slicedApple.resize(150,150); //define the constructor for the SlicedApples class
  }
  
  public void render(){
    image(slicedApple, x, y);
  }
}
