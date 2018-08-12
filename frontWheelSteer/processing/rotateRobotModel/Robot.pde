/* Create a simple model of a front-wheel steered robot */

class Robot{
  
  public static final float MAX_WHEEL_ANGLE = PI/6;
  
  // Top view, 2D representation
  private float bodyLength;
  private float bodyWidth;
  
  // Top view, 2D representation
  private float wheelWidth;
  private float wheelLength;
  
  // axle y location, robot coordinates
  private float axleY;
  
  
  private color bodyColor;
  private color wheelColor;
  
  // robot's center in world coordinate system
  private PVector worldCenter;
  
  private float heading;
  private float frontWheelAngle;
  
  Robot(float bWidth, float bLength, int cx, int cy, float rHeading, float fwAngle){
   
    bodyLength = bLength;
    bodyWidth = bWidth;
    
    // scale wheels to robot body size
    wheelWidth = bodyWidth/4;
    wheelLength = bodyLength/4;
    
    axleY = 3*bodyLength/8;    // relative to robot center
   
    worldCenter = new PVector(cx, cy);
    bodyColor = color(#0CD1F2);
    wheelColor = color(#000000);
    
    heading = rHeading;
    if(fwAngle <= MAX_WHEEL_ANGLE && fwAngle >= 0){
      frontWheelAngle = fwAngle;
    }
    else{
      frontWheelAngle = 0;
    }
  }
  
  
  void setFrontWheelAngle(float angle){
    if(angle <= MAX_WHEEL_ANGLE)
      frontWheelAngle = angle;
  }
  
  
  void setHeading(float angle){
    heading = angle;
  }
  
  
  void display(){
    pushMatrix();
    translate(worldCenter.x,worldCenter.y);
    rotate(heading);
    smooth();
    rectMode(CENTER);
    stroke(0);
    
    
    // draw body
    fill(bodyColor);
    rect(0, 0, bodyWidth, bodyLength);
    
     // draw robot's center point
    fill(0);
    ellipse(0, 0, bodyWidth/4, bodyLength/4);
    
    // draw line to indicate robot's y axis
    stroke(#05525F);
    strokeWeight(2);
    line(0, 0, 0, -bodyLength);
    
    
    // draw rear wheels
    fill(wheelColor);
    rect(-bodyWidth/2, axleY, wheelWidth, wheelLength);
    rect(bodyWidth/2, axleY, wheelWidth, wheelLength);
    
    
    // draw front wheels
    translate(-bodyWidth/2, -axleY);
    rotate(frontWheelAngle);
    rect(0, 0, wheelWidth, wheelLength);
    stroke(255,0,0);
    line(0,0,0,-wheelLength);
    
    rotate(-frontWheelAngle);
    translate(bodyWidth, 0);
    rotate(frontWheelAngle);
    stroke(0);
    rect(0,0, wheelWidth, wheelLength);
    stroke(255,0,0);
    line(0,0,0,-wheelLength);
    
    print("steer angle: " + degrees(frontWheelAngle) );
    println(", heading: " + degrees(heading));
    
    popMatrix();
  }
  
} // end Robot class definition
