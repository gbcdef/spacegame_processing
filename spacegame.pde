color darkblue=color(3, 53, 103);
color lightblue=color(103, 154, 255);
GRID p;
int gravity=5;//v=v0+at,gravity=a
int vel=20;//used for jump,give it a start velocity
int death=0, times=1;
Region[] block=new Region[3];
Table gameInfo;//13 columns,the 1st column represents the level of 
//difficulty,which has no influence on this program.
//and the 12 left stand for x1,y1,w1,h1,x2,y2,w2,h2,x3,y3,w3,h3
//you can customize your game by yourself!

void setup() {
  size(640, 480);
  background(darkblue);
  rectMode(CORNERS);
  noStroke();
  fill(lightblue);
  rect(0, height/3, width, height/3*2);
  frameRate(30);
  p=new GRID(0, height/3*2);
  gameInfo=new Table("games.txt");
  textFont(loadFont("ROTORcap-48.vlw"));
}


void draw() {
  drawD(gameInfo.getRowCount());

  //the move partition
  p.x +=10;

  //the jump partition
  p.y -=p.vy;
  if (p.y>=height/3*2) {
    p.y=height/3*2;
  }
  if (p.vy > -vel) {
    p.vy -= gravity;
  }

  if (p.x>width) {
    p.x=0;
    times+=1;
  }

  //the over partition
  if (times-1==gameInfo.getRowCount()) {
    fill(lightblue);
    rect(0, height/3, width, height/3*2);
    textAlign(CENTER);
    fill(darkblue);
    textSize(30);
    text("Congratulations!", width/2, height/2-25);
    textSize(24);
    text("More challenging games are coming...", width/2, height/2+25);
    noLoop();
    return;
  }

  //the block partition
  int[] tempData=new int[13];
  for (int i=0;i<13;i++) {
    tempData[i]=gameInfo.getInt(times-1, i);
  }
  block[0]=new Region(tempData[1], tempData[2], tempData[3], tempData[4]);
  block[1]=new Region(tempData[5], tempData[6], tempData[7], tempData[8]);
  block[2]=new Region(tempData[9], tempData[10], tempData[11], tempData[12]);
  for (int i=0;i<3;i++) {
    block[i].display();//draw the block
  }

  //draw the grid and draw the shadow effect of moving
  p.display();
  shadow();

  //let's begin with the most exciting part:die!
  for (int i=0;i<3;i++) {
    if ( isD(block[i]) ) {
      die();
    }
  }
}

void keyPressed() {
  if (keyCode==' ' && p.y==height/3*2) {
    p.vy=vel;
  }
}

