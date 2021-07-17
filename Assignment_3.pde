bubble[] bubbles = new bubble[12]; //Bubble array
fish[] fish = new fish[7]; // fish array
seaweed[] seaweed = new seaweed[7]; //seaweed array
PImage Fish; //fish image
PImage Bubble; //bubble image
PImage Seaweed; // seaweed image

void setup() {
  size(1280, 720);
  //set bubble image and array
  Bubble = loadImage("bubble.png");
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new bubble(i*4);
  }
  //set fish image and array
  Fish = loadImage("fish.png");
  for (int i = 0; i < fish.length; i++) {
    fish[i] = new fish();
  }
  //set seaweed image and array
  Seaweed = loadImage("seaweed.png");
  for (int i = 0; i < seaweed.length; i++) {
    seaweed[i] = new seaweed(200);
  }
}

void draw() {
  background(31, 84, 219);
  //draw bubble array and functions
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].ascend();
    bubbles[i].display();
    bubbles[i].top();
  }
    //draw seaweed array
  for (int i = 0; i < seaweed.length; i++) {
    seaweed[i].display();
  }
  //get every fish in the scene to prepare the collision
  for (int i = 0; i < fish.length; i++) {
    for (int j = i; j < fish.length; j++) {
      if (fish[i].isCollidingWith(fish[j])) {
        fish[i].bounceWith(fish[j]);
      }
            if (fish[i].fishGotClicked(fish[j])) {
        fish[i].bounceWith(fish[j]);
      }
    }
  }
  //calling the fish class
  for (int i = 0; i <fish.length; i++){
    fish[i].display();//display the fish
    fish[i].updateMovement();//move the fish
    fish[i].verifyCollision();//change direction when fish colide
   fish[i].colorChange();//change colour of fish with 'c'
  }
}

//moving fish in other direction when mouse is clicked
void mouseClicked() {
    //calling the fish class
  for (int i = 0; i <fish.length; i++){
  fish[i].fishClicked();
  }
}

//set tint to normal with 'v'
void keyPressed() {
     if (keyPressed) {
      if (key == 'v' || key == 'V') {
      tint(255, 255);
      }
    }
}