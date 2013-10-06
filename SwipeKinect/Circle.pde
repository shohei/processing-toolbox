class Circle {
  float xPos, yPos, eSize, opacity, speed; 
  float xDir, yDir;
  boolean released;
 
  Circle (float x, float y, float es) {
    xPos = x; 
    yPos = y; 
    eSize = es;
    opacity = 255;
    released = false;
  }
 
  void display() {
    ellipse(xPos, yPos, eSize, eSize);    
  }
  
  void fly() {    
    xDir = xDir * 0.7;
    yDir = yDir * 0.7;
    xPos = xPos + xDir;
    yPos = yPos + yDir;
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
    opacity -= random(0, 3);
    yPos += 5;
    fill(255, opacity);
    ellipse(xPos, yPos, eSize, eSize);
  }  
}



