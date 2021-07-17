class fish {
  
  int fishSize;                           // Size of the fish
  PVector fishPos = new PVector(0,0);     // Position of the fish
  PVector fishSpeed = new PVector(0,0);   // Speed of the fish
  float diameter;
  
  fish(){
     
     // Define the variables
     fishPos.x = random(10, 1270);
     fishPos.y = random(10, 710);
     fishSize = 70;
     fishSpeed.x = random(6);
     fishSpeed.y = random(6);
    
  }
  
  // Compare the position of the fish with another fish and return a boolean
  boolean isCollidingWith(fish fish)  {
    
    return dist(fishPos.x, fishPos.y, fish.fishPos.x, fish.fishPos.y) < 
    (fishSize + fish.fishSize) / 2;
    
  }
  
    boolean fishGotClicked(fish fish) {
    return dist(fishPos.x, fishPos.y, mouseX, mouseY) < (fishSize + fishSize) / 2;
  }
  
  // Make the object bounce by changing the direction on the x axis
  void bounceWith(fish fish)  {
    
     fishSpeed.x *= -1;
     fish.fishSpeed.x *= -1;
     
  }
  
//draw fish
  void display() {
     imageMode(CENTER);
image(Fish, fishPos.x, fishPos.y, fishSize, fishSize);
  }
  
  //Make the fish  move
  void updateMovement() {
   
    fishPos.x += fishSpeed.x;
    fishPos.y += fishSpeed.y;
    
  }
  
  //Verify collision with the boundaries of the sketch
  void verifyCollision() {
    
     if (fishPos.x - fishSize/2 < 0 || fishPos.x + fishSize/2 > width){
       fishSpeed.x *=-1;   
     } 
    
     if (fishPos.y - fishSize/2 < 0 || fishPos.y + fishSize/2 > height){
       fishSpeed.y *=-1;   
     } 
    
  }
  //change fish colour at the key press of c
    void colorChange() {
    if (keyPressed) {
      if (key == 'c' || key == 'C') {
      tint(random(255),random(255), random(255));
      }
    }
  }
  //verify collision with the boundries of the fish
  void fishClicked() {
    if (mousePressed || mouseX < fishPos.x || mouseX > fishSize){ //fishPos.x - fishSize/2 < 0 || fishPos.x + fishSize/2 > width
      fishSpeed.x *=-1;
    } 

    if (mousePressed || mouseY < fishPos.y || mouseY > fishSize){ //fishPos.y - fishSize/2 < 0 || fishPos.y + fishSize/2 > height
      fishSpeed.y *=-1;
    }
  }
}