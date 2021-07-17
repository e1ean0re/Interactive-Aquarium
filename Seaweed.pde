class seaweed{
  float x;
  float y;
  float diameter;
  
  seaweed (float tempD){
    diameter = tempD;
    x = random(100, 1250);
    y = 620;
  }
  
  void display() {
    imageMode(CENTER);
    image(Seaweed, x, y, diameter, diameter);
  }
}