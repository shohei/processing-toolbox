import org.openkinect.*;
import org.openkinect.processing.*;

ArrayList circles;
KinectTracker tracker;
Kinect kinect;

void setup() {
  size(640,520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  //frameRate(15);
  circles = new ArrayList();
}

void draw() {
  background(0);
  tracker.track();
  tracker.display();
  PVector v1 = tracker.getPos();
  PVector v2 = tracker.getLerpedPos();
  spawn(int(v1.x),int(v1.y));
  display();

  //fill(50,100,250,200);
  //noStroke();
  //ellipse(v1.x,v1.y,20,20);

//  fill(100,250,50,200);
//  noStroke();
//  ellipse(v2.x,v2.y,20,20);

//  int t = tracker.getThreshold();
//  fill(0);
//  text("threshold: " + t + "    " +  "framerate: " + (int)frameRate + "    " + "UP increase threshold, DOWN decrease threshold",10,500);
   

}

void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } 
    else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}

void stop() {
  tracker.quit();
  super.stop();
}


void spawn(int _x,int _y) {
  int size = int(random(0, 100));
  Circle c = new Circle(_x, _y, size);
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

