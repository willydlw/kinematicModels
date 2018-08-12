/* Test the front wheel steered robot model by turning front wheels
   from right to left and then changing the robot's heading.
   
   Purpose: test that robot is drawn as expected in the.
   
   Positive angle is a clockwise rotation in the output window
*/

Robot racer;
float angleDegrees;
float deltaHeadingAngle;
float steerAngle;
float deltaSteerAngle;
int revolutionCount;

int steeringCount;

void setup(){
  size(800,800);
  
  angleDegrees = 0;
  deltaHeadingAngle = 9;
  
  steerAngle = 0;
  deltaSteerAngle = 3;
  
  steeringCount = 0;
  
  // create a new robot object centered in the window
  racer = new Robot(30, 40, width/2, height/2, radians(angleDegrees), steerAngle);
  frameRate(20);
  surface.setTitle("Spinning robot - testing heading rotation and steering angle orientation");
}


void draw(){
  background(220);
  racer.display();
  
  // robot should steer right as far as possible, then steer left as far as possible
  // and return to a zero steering angle before changing heading
  if( steeringCount < 2){
    racer.setFrontWheelAngle(radians(steerAngle));
    if(abs(radians(steerAngle)) >= Robot.MAX_WHEEL_ANGLE){
      ++steeringCount;
      deltaSteerAngle = -deltaSteerAngle;
    }
    steerAngle += deltaSteerAngle;
  }
  else if(steeringCount == 2){
    steeringCount = 0;
    angleDegrees += deltaHeadingAngle;
    if(angleDegrees >= 360 || angleDegrees <= 0){
      ++revolutionCount;
      deltaHeadingAngle = -deltaHeadingAngle;
    }
     racer.setHeading(radians(angleDegrees));
  } 
}
