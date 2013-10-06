import ddf.minim.*;

AudioPlayer player;
Minim minim;
ArrayList circles;
int time = 0;


void setup() {
  size(800, 800);
  noStroke();
   
  minim = new Minim(this);
  player = minim.loadFile("xmas.mp3", 2048);
  player.play();   
   
  circles = new ArrayList();   
  
  for(int i = 0; i < 20; i++){
    float eSize = random(50, 150);
    float x = random(0, 800);
    float y = random(0, 800);
    Circle c = new Circle(x, y, eSize);
    circles.add(c);
    c = null;
  }
}


void draw() {
  
  background(color(225, 74, 151));

  if (time % 10 == 0) { 
    float eSize = random(50, 150);
    float x = random(0, 800);
    Circle c = new Circle(x, - 100, eSize);
    circles.add(c);
    c = null;
  }
  
  for(int i = 0; i < circles.size(); i++)
  {
    Circle c = (Circle)circles.get(i);
    c.update  ();
    c = null;
  }   
  
  if (circles.size() > 50) {
    circles.remove(0); 
  }

  println(time);
  time++;
  
}


void background() {
  //背景のを決める
  color c1 = color(134, 216, 234);
  color c2 = color(225, 74, 151);
  color gradation;
   
  //1と2の色の差をとってスケールを変える計算
  float gr = (red(c2) - red(c1)) / height;
  float gg = (green(c2) - green(c1)) / height;
  float gb = (blue(c2) - blue(c1)) / height;
  float r, g, b;

  //差し込む光
  for(int i = 0; i < 6; i++){
    float pos = random(width);
    float lightWidth = random(50, 150);
    for(int y = 500; y >= 0; y--){
      for(float x = pos; x < pos + lightWidth; x++){
        fill(255, 255 - y * 255 / 500);
        rect(x, y, 1, 1);
      }
    }
  }
  
  //グラデーションを描く
  for(int y = 0; y < height; y++){
    r = y * gr + red(c1);
    g = y * gg + green(c1);
    b = y * gb + blue(c1);
     
    gradation = color(r, g, b);
     
    for(int x = 0; x < width; x++){
      fill(gradation);
      rect(x, y, 1, 1);
    }
  }
}


