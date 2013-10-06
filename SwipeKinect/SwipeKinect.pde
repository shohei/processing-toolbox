import ddf.minim.*;
import java.util.Map;
import java.util.Iterator;
import SimpleOpenNI.*;

ArrayList positions;
int time = 0;
boolean dragging;
SimpleOpenNI context;
int handVecListSize = 20;
Map<Integer,ArrayList<PVector>>  handPathList = new HashMap<Integer,ArrayList<PVector>>();
color[]       userClr = new color[]{ color(255,0,0),
                                     color(0,255,0),
                                     color(0,0,255),
                                     color(255,255,0),
                                     color(255,0,255),
                                     color(0,255,255)
                                   };

Circle c;

void setup() {
  size(800, 800);
  noStroke();
  dragging = false;

  positions = new ArrayList();
  HashMap position = new HashMap();
  position.put("x", 0);
  position.put("y", 0);
  positions.add(position);

  float x = width / 2;
  float y = height / 2;
  float eSize = 100;
  c = new Circle(x, y, eSize);

  context = new SimpleOpenNI(this);
  if(context.isInit() == false)
  {
     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
     exit();
     return;  
  } 
  context.enableDepth();
  context.setMirror(true);
  context.enableHand();
  context.startGesture(SimpleOpenNI.GESTURE_WAVE);
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

void draw() {
  background(color(225, 74, 151));

  context.update();
  image(context.depthImage(),0,0);
  if(handPathList.size() > 0)  
  {    
    Iterator itr = handPathList.entrySet().iterator();     
    while(itr.hasNext())
    {
      Map.Entry mapEntry = (Map.Entry)itr.next(); 
      int handId =  (Integer)mapEntry.getKey();
      ArrayList<PVector> vecList = (ArrayList<PVector>)mapEntry.getValue();
      PVector p;
      PVector p2d = new PVector();      
      Iterator itrVec = vecList.iterator(); 
      p = vecList.get(0);
      context.convertRealWorldToProjective(p,p2d);
      ellipse(p2d.x,p2d.y,20,20);
      
      
      HashMap<String, Integer> position = new HashMap<String, Integer>();
      position.put("x", int(p2d.x));
      position.put("y", int(p2d.y));
      positions.add(position);
      c.xPos = p2d.x;
      c.yPos = p2d.y;
    
      if (positions.size() > 2) {
        positions.remove(0);
      }
      println(positions);
      
      
      c.xPos = p2d.x;
      c.yPos = p2d.y;
            
      if (released() == true) {
        c.fly();
      }
      c.display();
    }            
  }
}


boolean released() {
  HashMap first = (HashMap)positions.get(0);
  HashMap last = (HashMap)positions.get(positions.size() - 1);
  float xDir = (Integer)last.get("x") - (Integer)first.get("x");
  float yDir = (Integer)last.get("y") - (Integer)first.get("y");

  if (xDir > 100) { 
    return true;
  } else {
    return false;
  }
}


// -----------------------------------------------------------------
// hand events

void onNewHand(SimpleOpenNI curContext,int handId,PVector pos)
{
  println("onNewHand - handId: " + handId + ", pos: " + pos);
 
  ArrayList<PVector> vecList = new ArrayList<PVector>();
  vecList.add(pos);
  
  handPathList.put(handId,vecList);
}

void onTrackedHand(SimpleOpenNI curContext,int handId,PVector pos)
{
  //println("onTrackedHand - handId: " + handId + ", pos: " + pos );
  
  ArrayList<PVector> vecList = handPathList.get(handId);
  if(vecList != null)
  {
    vecList.add(0,pos);
    if(vecList.size() >= handVecListSize)
      // remove the last point 
      vecList.remove(vecList.size()-1); 
  }  
}

void onLostHand(SimpleOpenNI curContext,int handId)
{
  println("onLostHand - handId: " + handId);
  handPathList.remove(handId);
}

// -----------------------------------------------------------------
// gesture events

void onCompletedGesture(SimpleOpenNI curContext,int gestureType, PVector pos)
{
  println("onCompletedGesture - gestureType: " + gestureType + ", pos: " + pos);
  
  int handId = context.startTrackingHand(pos);
  println("hand stracked: " + handId);
}



