import ddf.minim.*;

ArrayList positions;
int time = 0;
boolean dragging;
float x, y, eSize;


Circle c;

void setup() {
  size(800, 800);
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);

  dragging = false;

  positions = new ArrayList();
  HashMap position = new HashMap();
  position.put("x", 0);
  position.put("y", 0);
  positions.add(position);
  
  x = width / 2;
  y = height / 2;
  eSize = 300;
  c = new Circle(x, y, eSize);

}

void draw() {
  background(color(225, 74, 151));

  rect(x, y, 300, 300);
/*
  if (dragging == false) {
    c.fly();
  }
*/
  c.display();
}

void mouseDragged() {
  dragging = true;
  HashMap<String, Integer> position = new HashMap<String, Integer>();
  position.put("x", mouseX);
  position.put("y", mouseY);
  positions.add(position);

  c.xPos = mouseX;
  c.yPos = mouseY;

  if (positions.size() > 2) {
    positions.remove(0);
  }

  println(positions);
}

void mouseReleased() {  
  dragging = false;
  HashMap first = (HashMap)positions.get(0);
  HashMap last = (HashMap)positions.get(positions.size() - 1);
  float xDir = (Integer)last.get("x") - (Integer)first.get("x");
  float yDir = (Integer)last.get("y") - (Integer)first.get("y");
  
  println(xDir);
  println(yDir);
  
  int limit = 20;
  if (xDir > limit || yDir > limit ) {
    xDir = xDir * 0.5; 
    yDir = yDir * 0.5; 
  }

  c.xDir = xDir;
  c.yDir = yDir;
}





