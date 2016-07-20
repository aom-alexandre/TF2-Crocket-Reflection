PImage pred;
PImage pblu;

PImage crocket;
PImage icrocket;
int x;
int speed;
int refr = 0;
int refb = 0;

PImage redv;
PImage bluv;
PImage tie;

void setup(){
  size(1300, 700);
  
  crocket = loadImage("crocket.png");
    
  pred = loadImage("pred.png");
  pblu = loadImage("pblu.png");
  
  redv = loadImage("redv.png");
  bluv = loadImage("bluv.png");
  tie = loadImage("tie.png");
  
  x = width - pred.width - crocket.width - 51;
  speed = 1;
  
  print("In this game you are meant to keep the crocket from blowing you up!");
  print(" Blu pyro uses 'A' to reflect.");
  print(" Red pyro uses 'L' to reflect.");
}

void drawBase(){
  background(0, 0, 0);
  
  fill(160,82,45);
  rect(0, 650, 1300, 50);
  
  fill(169,169,169);
  rect(pblu.width + 50, height - pblu.height, 2, pblu.height - 50);
  
  fill(169,169,169);
  rect(width - pred.width - 50, height - pred.height, 2, pred.height - 50);
  
  image(pred, width - pred.width, height - pred.height - 50);
  image(pblu, 0, height - pblu.height - 50);
  
  fill(255, 255, 255);
  textSize(50);
  text("speed:", 500, 200);
  text(speed, 700, 200);
  
  fill(255, 0, 0);
  textSize(30);
  text("L", width - pred.width/2, height - pred.height - 90);
   
  fill(0, 0, 255);
  textSize(30);
  text("A", pblu.width/2, height - pblu.height - 100);
}

void Reflect(){
  if ((x <= pblu.width + 50) && (refb == 1)){
  speed = -speed - 1;
  crocket = loadImage("tekcorc.png");
  }
  if ((x >= width - pred.width - crocket.width - 50) && (refr == 1)){
  speed = -speed + 1;
  crocket = loadImage("crocket.png");
  }
}

boolean hitRed(){
  if (x >= width - pred.width - crocket.width)
    return true;
  else
    return false;
}

boolean hitBlu(){
  if (x <= pblu.width)
    return true;
  else
    return false;
}

boolean speedMax(){
  if (speed >= 50)
    return true;
  else
    return false;
}

void draw(){
  
  drawBase();
  
  Reflect();
  
  image(crocket, x, 450);
  x = x - speed;
  refr = 0;
  refb = 0;
  
  if (hitRed()){
    background(0, 0, 255);
    image(bluv, width/2 - bluv.width/2, 0);
    noLoop();
  }

  if (hitBlu()){
    background(255, 0, 0);
    image(redv, width/2 - redv.width/2, 0);
    noLoop();
  }

  if (speedMax()){
    background(0, 255, 0);
    image(tie, width/2 - redv.width/2, 0);
    noLoop();
  }
}

void keyPressed(){
  if (key == 'a'){
  refb = 1;
  }
  else if (key == 'l'){
  refr = 1;
  }
//  if (key == 't'){
//  background(0, 0, 255);
//  image(bluv, width/2 - bluv.width/2, 0);
//  noLoop();
//  }
//  else if (key == 'y'){
//  background(255, 0, 0);
//  image(redv, width/2 - redv.width/2, 0);
//  noLoop();
//  }
}