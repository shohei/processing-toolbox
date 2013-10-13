Circle c;
boolean dragging;

void setup() {
  size(800, 800);
  noStroke();
  dragging = false;

  float x = width / 2;
  float y = height / 2;
  float eSize = 100;
  c = new Circle(x, y, eSize);
}


void mouseDragged() {
  dragging = true;
  c.xPos = mouseX;
  c.yPos = mouseY;
}

void mouseReleased() {  
  dragging = false;

  c.xDir = mouseX - pmouseX;
  c.yDir = mouseY - pmouseY;
}

void draw() {
  background(color(225, 74, 151));

  if (dragging == false) {
    c.fly();
  }
  c.display();
}



