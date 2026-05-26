class WormApples extends Apple{ //make the WormApples class a subclass (extends) of the Apple class
  
  
  WormApples(int x, int y){
    super(x,y); //cause the WormApples class to have the same member variables as the Apple class without having to re-define them
  }
  
  
  void loadImages(){
    for(int i=0; i<4; i++){
      apple[i] = loadImage("appleworm" + (i+1) + ".png");
      apple[i].resize(75,75); //define the constructor for the WormApples class
    }
  }
  
  boolean isWorm(){
    return true;
  }
  
}