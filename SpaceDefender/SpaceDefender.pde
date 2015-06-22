Ship Player;
Missile[] AllMissiles = new Missile[20];
Alien[] Horde = new Alien[20];
boolean lost = false;
boolean pause = false;
int score = 0;
int numLeft = 0;

void setup(){
  size(700,700);
  Player = new Ship();
  AlienSetUp(1);
}

void draw(){
  if (lost || pause){
    if (lost){
      Lost();
    }
  } else {
    background(255);
    Player.display();
    if (numLeft==0){
      AlienSetUp(1);
    }  
    score();
    for (int i=0; i<20; i++){
      if (AllMissiles[i]!=null){
        AllMissiles[i].move();
        AllMissiles[i].display();
        if (AllMissiles[i].OutOfBounds()){
          AllMissiles[i]=null;
        } else if (AllMissiles[i].direction<0 && AllMissiles[i].hit(Player.xcor,Player.ycor)){
          lost = true;
          Player.explode();
        } else {
          for (int A=0; A<20; A++){
            if (Horde[A]!=null){
              if (AllMissiles[i].direction>0 && AllMissiles[i].hit(Horde[A].xcor,Horde[A].ycor)){
                AllMissiles[i] = null;
                Horde[A] = null;
                score++;
                numLeft--;
                break;
              }
            }
          }
        }
      }
    }
    for (int i=0; i<20;i++){
      if (Horde[i]!=null){
        Horde[i].display();
        if (random(1)>0.999){
          shoot(false, Horde[i].xcor, Horde[i].ycor);
        }
      }
    }
  }
}

void shoot(boolean ours, float xcor, float ycor){
  int i2 = -1;
  for (int i=0;i<20;i++){
    if (AllMissiles[i]==null){
      i2 = i;
      break;
    }
  }
  if (i2!=-1){
    if (ours){
      AllMissiles[i2] = new Missile(xcor+20.5, ycor-30, 5);
    } else {
      AllMissiles[i2] = new Missile(xcor+37, ycor, -5);
    }
  }
}

void AlienSetUp(int n){
  int i = 0;
  for (int r=1; r<7; r++){
    for (int c=1; c<3; c++){
      if (Horde[i]==null){
        Horde[i] = new Alien(r*100,c*100);
      } else {
        Horde[i].xcor = r*100;
        Horde[i].ycor = c*100;
      }
      i++;
    }
  }
  numLeft = 12;
}

void score(){
  textAlign(LEFT);
  textSize(32);
  fill(0, 102, 153, 51);  
  text(score, 10, 30);
}

void Lost(){
  textAlign(CENTER);
  textSize(128);
  fill(0, 102, 153);  
  text("Dead!", 350, 350);
  fill(255); 
  rect(300,370,100,50);
  fill(0);
  textSize(32);
  textAlign(CENTER);
  text("Retry?", 350, 405); 
}
  
void keyPressed(){
  if (key=='w'){//w
    Player.move(key);
  } else if (key=='a'){ //a
    Player.move(key);
  } else if (key=='s'){
    Player.move(key);
  } else if (key=='d'){
    Player.move(key);
  } else if (key=='k'){
    if (Player.shot > 50 && Player.cooldown<20){
      shoot(true, Player.xcor, Player.ycor);
      Player.shot -= 50;
      Player.cooldown+=50;
    }
  }
  else if (key=='p'){
    pause = !pause;
  }
}
  
void mousePressed(){
  if (lost){
    if (mouseX-350<100 && mouseY-350<50){
      lost = false;
      score = 0;
      ResetAll();
    }
  }
}

void ResetAll(){
  for (int i=0; i<20; i++){
    //Horde[i] = null;
    AllMissiles[i] = null;
  }
  AlienSetUp(1);
}
