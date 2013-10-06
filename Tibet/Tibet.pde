import ddf.minim.*;
import processing.video.*;

AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;

Minim minim;
Minim minim2;
Minim minim3;

PImage bg;

float xmag, ymag = 0;
float newXmag, newYmag = 0; 
float VARX, VARY = 0;

void setup()
{
  size(740, 473, P3D); 
  noStroke(); 
  colorMode(RGB, 1); 

  bg = loadImage("tibet.jpg");

  //mm = new MovieMaker(this, width, height, "drawing.mov", 30, MovieMaker.H263, MovieMaker.HIGH);

  //try {
   //Thread.sleep(5000);
   //} catch (InterruptedException e) { }

  minim = new Minim(this);
  player = minim.loadFile("Love_the_way_you_love-Suede.mp3", 2048);
  player.play();

  minim2 = new Minim(this);
  player2 = minim.loadFile("tibet.mp3", 2048);
  player2.play();

  minim3 = new Minim(this);
  player3 = minim.loadFile("sc.mp3", 2048);

  //image(bg,0,0);
  //tint(255, 126);

}

void draw()
{
  background(0,0,0);//black

  //  image(bg,0,0);
  //tint(0,0,0,255);
  image(bg,0,0);
  int alpha = int(random(255));
  tint(alpha,0,0,126);

  //background(255,255,255,255);
  //background(bg);

  pushMatrix(); 
 
  translate(width/2, height/2, -30); 
  
  //newXmag = mouseX/float(width) * TWO_PI;
  //newYmag = mouseY/float(height) * TWO_PI;
  VARX += player.left.get(0)*50;
  VARY += player.right.get(0)*50;
  newXmag = VARX/float(width) * TWO_PI;
  newYmag = VARY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { xmag -= diff/4.0; }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/4.0; }
  
  rotateX(-ymag); 
  rotateY(-xmag); 
  
  scale(90);
  beginShape(QUADS);

  fill(0, 1, 1); vertex(-1,  1,  1);
  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(1, 0, 1); vertex( 1, -1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);

  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);
  fill(1, 0, 1); vertex( 1, -1,  1);

  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(0, 0, 0); vertex(-1, -1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);

  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(0, 1, 1); vertex(-1,  1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);
  fill(0, 0, 0); vertex(-1, -1, -1);

  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(0, 1, 1); vertex(-1,  1,  1);

  fill(0, 0, 0); vertex(-1, -1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);
  fill(1, 0, 1); vertex( 1, -1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);

  endShape();
  
  popMatrix(); 

  //background(0);
  //stroke(255);
  stroke(0,255,120);
  for(int i = 0; i < player.left.size()-1; i++)
  {
    line(i, 150 + player.left.get(i)*50, i+1, 151 + player.left.get(i+1)*50);
    line(i, 250 + player.right.get(i)*50, i+1, 251 + player.right.get(i+1)*50);
  }
  
  //mm.addFrame();

}

void stop()
{
  player.close();
  minim.stop();  
  player2.close();
  minim2.stop();  

  minim3.stop();  

  super.stop();
}

void keyPressed() {

  if (key == 's') {
       player3.play();
       player.pause();
       delay(10);
       player.play();
    }

  if (key == 'r') {
       player3 = minim.loadFile("sc.mp3", 2048);
    }


}


