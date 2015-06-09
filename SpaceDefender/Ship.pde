class Ship{
  PImage SS;
  float xcor;
  float ycor;

  public Ship(){
    SS = loadImage("SpaceShip.jpg");
    xcor = 300;
    ycor = 600;
  }

  public void display(){
    image(SS, xcor, ycor, 50, 50);
  }
  
  public void move(int i){
    if (i==1){//w
      ycor -= 5;
    } else if (i==2){
      xcor -= 5;
    } else if (i==3){
      ycor += 5;
    } else {
      xcor += 5;
    }
  } 
  
}
