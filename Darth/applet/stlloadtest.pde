import toxi.geom.*;
import toxi.geom.mesh.*;

import toxi.processing.*;

TriangleMesh mesh;
ToxiclibsSupport gfx;
float cx,cy =0;
float r = width/(4.0);
int count = 0;
float theta = 0;
int ii = 360;

void setup() {
  size(600,600,P3D);
  mesh=(TriangleMesh)new STLReader().loadBinary(sketchPath("data/darth.stl"),STLReader.TRIANGLEMESH);
  //mesh=(TriangleMesh)new STLReader().loadBinary(sketchPath("mesh-flipped.stl"),STLReader.TRIANGLEMESH).flipYAxis();
  gfx=new ToxiclibsSupport(this);
}

void draw() {
  background(51);
  lights();
  translate(width/2,height/2,0);
  //rotateX(mouseY*0.01);
  //rotateY(mouseX*0.01);
  count = ii % 360;
  theta = 2*PI*(count/360.0);
  cx = r * cos(theta)* 10;
  cy = r * sin(theta) * 10;
  print("ii: "+ii +" count: "+ count+" theta: "+theta+" cx: "+cx +" cy: "+cy);
  ellipse(cx,cy,20,20);

  rotateX(cy*0.01);
  rotateY(cx*0.01);
  gfx.origin(new Vec3D(),200);
  noStroke();
  gfx.mesh(mesh,false,10);

  ii += 1;
}



