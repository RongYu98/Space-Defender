class Alien{
  PImage SS;
  float xcor;
  float ycor;
  float xv;
  float yv;

  public Alien(float x, float y){
    SS = loadImage("UFO.png");
    xcor = x;
    ycor = y;
    xv = random(2) - 1;
    yv = 1 - abs(xv);
    if (random(1)<.5){
      yv *=-1;
    }
  }
  
  public void check(){
    if (xcor>675 || xcor<0){
      xv=(-1)*xv;
    }
    if (ycor>300 || ycor<0){
      yv=(-1)*yv;
    }
  }

  public void display(){
    check();
    xcor += xv;
    ycor += yv;
    image(SS, xcor, ycor, 75, 50);
  }

}
