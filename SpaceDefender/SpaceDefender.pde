Ship Player;

void setup(){
  size(700,700);
  Player = new Ship();
}

void draw(){
  background(255);
  Player.display();
}

void keyPressed(){
  if (key==119){//w
    Player.move(1);
  } else if (key==97){ //a
    Player.move(2);
  } else if (key==115){
    Player.move(3);
  } else if (key==100){
    Player.move(4);
  }
}
