class bubble {

    float x;
  float y;
  float diameter;
  float yspeed;

  bubble (float tempD) {
    x = random(width);
    y = height;
    diameter = tempD;
    yspeed = random(0.5, 2.5);
  }

  void ascend() {
    y = y - yspeed;
    x = x + random(-2, 2);
  }

  void display() {
    imageMode(CENTER);
    image(Bubble, x, y, diameter, diameter);
  }

  void top() {
    if (y < diameter/2) {
      y = height+diameter/2;
    }
  }
}