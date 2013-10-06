import processing.core.*; 
import processing.xml.*; 

import toxi.geom.*; 
import toxi.geom.mesh.*; 
import toxi.processing.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class stlloadtest extends PApplet {






TriangleMesh mesh;
ToxiclibsSupport gfx;
float cx,cy =0;
float r = width/(4.0f);
int count = 0;
float theta = 0;
int ii = 360;

public void setup() {
  size(600,600,P3D);
  mesh=(TriangleMesh)new STLReader().loadBinary(sketchPath("data/darth.stl"),STLReader.TRIANGLEMESH);
  //mesh=(TriangleMesh)new STLReader().loadBinary(sketchPath("mesh-flipped.stl"),STLReader.TRIANGLEMESH).flipYAxis();
  gfx=new ToxiclibsSupport(this);
}

public void draw() {
  background(51);
  lights();
  translate(width/2,height/2,0);
  //rotateX(mouseY*0.01);
  //rotateY(mouseX*0.01);
  count = ii % 360;
  theta = 2*PI*(count/360.0f);
  cx = r * cos(theta)* 10;
  cy = r * sin(theta) * 10;
  print("ii: "+ii +" count: "+ count+" theta: "+theta+" cx: "+cx +" cy: "+cy);
  ellipse(cx,cy,20,20);

  rotateX(cy*0.01f);
  rotateY(cx*0.01f);
  gfx.origin(new Vec3D(),200);
  noStroke();
  gfx.mesh(mesh,false,10);

  ii += 1;
}



  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "stlloadtest" });
  }
}
