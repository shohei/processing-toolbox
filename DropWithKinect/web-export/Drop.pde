ArrayList circles;

void setup() {
  size(500, 500);

  circles = new ArrayList();
}


int value = 0;

Circle c;

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

//Circleクラスの宣言
class Circle {
  float xPos, yPos, opacity; 
  int speed, eSize;
 
  Circle (float x, float y, int es) {    //初期化用のメソッド（コンストラクタ）
    xPos = x;    //x座標の初期値は0.0
    yPos = y;     //y座標の初期値はオブジェクトを宣言した際の引数になる
    eSize = es;
    opacity = 255;
  }
 
  void dot() {
    eSize += 2;
    opacity -= 5;
    noFill();
    stroke(opacity);
    strokeWeight(3);
    ellipse(xPos, yPos, eSize , eSize);
  }
 
  //円の位置を更新するメソッド
  void update() {
    speed = 10;
    xPos += speed;    //speed分のx座標を移動
    if (xPos > width) {    //円のx座標がウィンドウの幅を超えたら、
      xPos = 0;    //位置を0に戻す
    }
    ellipse(xPos, yPos, eSize, eSize);    //円を描く
  }
  
  
}

