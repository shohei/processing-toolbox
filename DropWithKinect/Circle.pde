class Circle {
  float xPos, yPos, opacity; 
  int speed, eSize;
 
  Circle (float x, float y, int es) {
    xPos = x; 
    yPos = y; 
    eSize = es;
    opacity = 255;
  }
 
  void dot() {
    eSize += 2;
    opacity -= 5;
    noFill();
    stroke(opacity);
    strokeWeight(3);
    ellipse(xPos, yPos, eSize, eSize);
  }
 
  void update() {
    speed = 10;
    xPos += speed; 
    if (xPos > width) {
      xPos = 0; 
    }
    ellipse(xPos, yPos, eSize, eSize);
  }
  
  
}
