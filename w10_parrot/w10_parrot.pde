
Arrow arrow; //set arrow As Arrow Object
Parrot parrot;  //set parrot As Parrot Object
void setup() {
  size(1000, 1000);
  parrot = new Parrot(); //instance new object
  arrow = new Arrow();
}

void draw() {
  background(255);  //set back ground  as white
  fill(0); //fill with black
  parrot.drawParrot(); //draw ballObject
  arrow.drawArrow(parrot.getXposition(), parrot.getYposition());  //draw new line from getter method 
}

public class Parrot {
  private int positionX, positionY, size;  //set positionX,Y,size,speed as attribute
  private float speed;

  Parrot() {  //default attribute
    size=100;
    positionX=width/2;  //half of canvas
    positionY=height/2;
    speed=0.05;
  }

  void drawParrot() {
    ellipse(positionX, positionY, size, size);  //draw ball
    this.move();  //move ball
  }

  public float getXposition() { //getter positionX
    return positionX;
  }

  public float getYposition() { //getter positionY
    return positionY;
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
  float centerY, centerX;  //set centerX,Y and size as attribute
  float size;

  Arrow() {  //default constructor
    centerY = height-50;  //set center as edge of canvas
    centerX = width-50;
    size = centerX/6;
  }

  public void drawArrow(float x, float y) {
    strokeWeight(10);
    line(centerX, centerY, x, y);  //draw line to x,y position from center
  }
}
