import ddf.minim.*;

AudioPlayer player, sc;
Minim minim, scMinim;

ArrayList positions;
int time = 0;
boolean dragging;
float x, y, eSize;

PImage artwork, imgMask;
float angle;

Circle c;

void setup() {
  size(800, 800);
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  dragging = false;

  minim = new Minim(this);
  player = minim.loadFile("Viva_La_Vida.mp3", 2048);
  player.play();

  scMinim = new Minim(this);
  sc = minim.loadFile("sc.mp3", 2048);


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

  translate(width/2,height/2);
  angle++;
  float c = angle * 0.02;
  rotate(c);
//  rect(0, 0, 300, 300);
  artwork = loadImage("Viva_La_Vida.jpg");
image(artwork, 0, 0);
  
}

void mouseDragged() {
  angle = mouseY;
  if (!sc.isPlaying()) {
    sc.rewind();
    sc.play();
  }
  player.pause();
}

void mouseReleased() {  
  player.play();
}





