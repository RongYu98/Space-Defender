class Ship{
  PImage SS;
  PImage Dead;
  float xcor;
  float ycor;
  int shot = 100;
  int cooldown = 0;

  public Ship(){
    SS = loadImage("SpaceShip.jpg");
    Dead = loadImage("Explosion.jpg");
    xcor = 300;
    ycor = 600;
  }

  public void display(){
    image(SS, xcor, ycor, 50, 50);
    shot++;
    if (cooldown > 0){
      cooldown--;
    }
  }
  
  public void explode(){
    image(Dead, xcor, ycor, 50, 50);
  }
  public void move(char c){
    if (c=='w'){//w
      if (ycor > 400){
        ycor -= 5;
      }
    } else if (c=='a'){
      if (xcor > 5){
        xcor -= 5;
      }
    } else if (c=='s'){
      if (ycor < 650){
        ycor += 5;
      }
    } else {
      if (xcor < 650){
        xcor += 5;
      }
    }
  }
}
