
Arrow arrow; //set arrow As Arrow Object
Parrot parrot;  //set parrot As Parrot Object
PImage photo; //set photo As Pimage Object
void setup() {
  size(1000, 1000);
  parrot = new Parrot(); //instance new object
  arrow = new Arrow();
  photo = loadImage("parrot4.jpeg");
  imageMode(CENTER);
}

void draw() {
  background(247);  //set back ground  as white
  fill(0); //fill with black
  parrot.drawParrot(); //draw ballObject
  arrow.drawArrow(parrot.getXposition(), parrot.getYposition(), parrot.getSize());  //draw new line from getter method
}

public class Parrot {
  private int positionX, positionY, size;  //set positionX,Y,size,speed as attribute
  private float speed;

  Parrot() {  //default attribute
    size=275;
    positionX=width/2;  //half of canvas
    positionY=height/2;
    speed=0.05;
  }

  void drawParrot() {
    image(photo, positionX, positionY, size, size);  //set picture
    this.move();  //move picture
  }

  public float getXposition() { //getter positionX
    return positionX;
  }

  public float getYposition() { //getter positionY
    return positionY;
  }
  
  public float getSize() { //getter size
    return size;
  }

  private void move() {
    if(mouseX != positionX){  //if mouse is not  save as positionX
    float targetX = mouseX;    //collect mouseX position
    float distanceX = targetX - positionX;  // calculate distance
    positionX += distanceX * speed;  //move depend on how long is distance
    }
    if(mouseY != positionY){
    float targetY = mouseY;
    float distanceY = targetY - positionY;
    positionY += distanceY * speed;
    }
  }
}


public class Arrow {
  float centerY, centerX;  //set centerX,Y and radius as attribute
  float radius;

  Arrow() {  //default constructor
    centerY = height-50;  //set center as edge of canvas
    centerX = width-50;
    radius = centerX/6;  //set radius as center/6
  }

  public void drawArrow(float x, float y, float z) {
    strokeWeight(10);
    float zeta = atan2((centerY-y),(centerX-x));  //get angle from Parrot  that return -pi/2 -> pi/2
    /*if (y>centerY && x>centerX) {      //add -pi/2 -> -pi
      zeta+=PI;
    } else if (y<centerY && x>centerX) {  //add pi/2 -> pi
      zeta+=-PI;
    }*/
    float arrowHeadX = centerX-cos(zeta)*radius, arrowHeadY = centerY-sin(zeta)*radius;
    float arrowTailX1 = arrowHeadX-(cos(5*PI/6 + zeta)*(radius/2)), arrowTailY1 = arrowHeadY-(sin(5*PI/6 + zeta)*(radius/2));
    float arrowTailX2 = arrowHeadX-(cos(-5*PI/6 + zeta)*(radius/2)), arrowTailY2 = arrowHeadY-(sin(-5*PI/6 + zeta)*(radius/2));
    line(centerX, centerY, arrowHeadX, arrowHeadY);  //draw free line to point parrot
    line(arrowHeadX, arrowHeadY, arrowTailX1, arrowTailY1);
    line(arrowHeadX, arrowHeadY, arrowTailX2, arrowTailY2);
  }
}
