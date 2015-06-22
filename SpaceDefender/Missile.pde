class Missile{
  PImage projectile;
  int direction;
  float xcor;
  float ycor;
  
  public Missile(float x, float y, int direct){
    if (direct > 0){
      projectile = loadImage("MissileUp.png");
    } else {
      projectile = loadImage("MissileDown.png");
    }
    xcor = x;
    ycor = y;
    direction = direct;
  }
  
  public void display(){
    image(projectile, xcor, ycor, 10, 40);
  }
  
  public void move(){
    ycor -= direction;
  }
  
  public boolean hit(float x, float y){
    return (sqrt( sq(xcor-x-20) + sq(ycor-y) ) < 40);
  }  
  
  public boolean OutOfBounds(){
    return (ycor>700||ycor<0);
  }
}
