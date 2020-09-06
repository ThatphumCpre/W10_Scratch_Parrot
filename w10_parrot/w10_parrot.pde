
Parrot parrot;  //set parrot As Parrot Object
void setup() {
  size(1000, 1000);
  parrot = new Parrot(); //instance new object
}

void draw() {
  background(255);  //set back ground  as white
  fill(0); //fill with black
  parrot.drawParrot(); //draw ballObject
}

public class Parrot {
  private int positionX, positionY, size;  //set positionX,Y,size,speed as attribute
  private float speed;

  Parrot() {  //default attribte
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
