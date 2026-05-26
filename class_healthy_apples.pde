class HealthyApples extends Apple{ //make the HealthyApples class a subclass (extends) of the Apple class
  
  
  HealthyApples(int x, int y){
    super(x,y); //cause the HealthyApples class to have the same member variables as the Apple class without having to re-define them
  }
  
  
  void loadImages(){
    for(int i=0; i<4; i++){
      apple[i] = loadImage("apple" + (i+1) + ".png");
      apple[i].resize(75,75); //define the constructor for the HealthyApples class
    }
  }
  
  boolean isWorm(){
    return false;
  }
  
}