ArrayList circles;

void setup() {
  size(500, 500);
  frameRate(15);
  circles = new ArrayList();
}

void draw() {
  background(0);
  spawn();
  display();
  println(circles.size());
}

void spawn() {
  int size = int(random(0, 100));
  Circle c = new Circle(mouseX, mouseY, size);
  circles.add(c);
  c = null;
  if (circles.size() > 100) {
    circles.remove(0);
  }
}

void display() {
  for(int i = 0; i < circles.size(); i++)
  {
    Circle c = (Circle)circles.get(i);
    c.dot();
    c = null;
  }
}
 
void mouseClicked() {
  int r = int(random(0, 255));
  int g = int(random(0, 255));
  int b = int(random(0, 255));
  //  fill(r, g, b);
}

