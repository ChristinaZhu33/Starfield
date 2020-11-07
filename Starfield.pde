Particle[] dot = new Particle[250]; 

void setup(){
  background(0);
  size(600,600);
  for(int i = 0; i < dot.length; i++)
  {
    dot[i] = new Particle(); 
    dot[0] = new OddballParticle();
    dot[1] = new OddballParticle();  
    dot[2] = new OddballParticle();  
    dot[3] = new OddballParticle(); 
    dot[4] = new OddballParticle(); 
    dot[5] = new OddballParticle(); 
    dot[6] = new Oddball2Particle();
    dot[7] = new Oddball2Particle();
}
}

void draw(){
  fill(0,0,0,20);
  rect(0,0,600,600);
  for(int i = 0; i < dot.length; i++){
    dot[i].show();
    dot[i].move();
    dot[i].reset();
  }
}

class Particle{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  Particle(){
    myX = 300;
    myY = 300;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = (Math.random()*4+1);
    myColor = color((int)Math.random()*50+200,(int)Math.random()*50+200,255);
  }
  void move(){
    myX = myX + Math.cos(myAngle)* mySpeed;
    myY = myY + Math.sin(myAngle)* mySpeed;
    
  }
  void show(){
    fill(myColor);
    ellipse((float)myX,(float)myY,4,4);
  }
  void reset(){
    if (myX > 600|| myX < 0|| myY > 600 || myY < 0 ){
      for(int i = 0; i < dot.length; i++){
    myX = myY = 300;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*4+1;
      }
    }
  }
}

class OddballParticle extends Particle 
{
  OddballParticle(){
    myX = myY = 300;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*10;
    myColor = color(241,(int)Math.random()*15+220,255);
    
  }
  void move(){
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
  }
  void show(){
    fill(myColor);
    triangle((int)myX,(int)myY,(int)myX+20,(int)myY,(int)myX+10,(int)myY-20);
  }
}

class Oddball2Particle extends Particle{
  void show(){
    noStroke();
    fill(255);
    ellipse((float)myX,(float)myY,10,10);
  }
}

