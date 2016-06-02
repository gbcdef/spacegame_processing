void shadow(){
  fill(darkblue,35);
  rect(0,height/9,width,height);
  fill(lightblue,70);
  rect(0,height/3,width,height/3*2);
}

//just add 1 to the score
void die(){
    death += 1;
    p.explode();
    p.initial();
}

//draw the text of the times died,and the games are being played
void drawD(int total){
  fill(darkblue);
  rect(0,0,width,height/9);
  fill(lightblue);
  textSize(24);
  textAlign(LEFT);
  text("DEATH "+death,10,30);
  text("GAMES "+times+"/"+total,200,30);
}

//the amazing part!use four points to verify if the box is dead already
//use the same coordinate as class Region
Boolean isD(Region a1){
  int x1,x2,y1,y2;
  x1=p.x-10;
  x2=p.x+10;
  y1=height/3*2-p.y;
  y2=height/3*2-p.y-20;
  noStroke();
  Point[] pt=new Point[4];
  for(int i=0;i<4;i++){
    pt[i]=new Point(0,0);
  }
  pt[0].x=pt[1].x=x1;
  pt[0].y=pt[3].y=y1;
  pt[1].y=pt[2].y=y2;
  pt[2].x=pt[3].x=x2;
  for (int i=0;i<4;i++){
    if ((pt[i].x-a1.x)*(pt[i].x-a1.x-a1.w)<=0 && (pt[i].y-a1.y)*(pt[i].y-a1.y-a1.h)<=0){
      return true;
    }
  }
  return false;
}
