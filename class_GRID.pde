class GRID{
  int x;
  int y;
  int vy=0;
  GRID(int tempX,int tempY){
    x=tempX;
    y=tempY;
  }
    
  void display(){
    fill(darkblue);
    rect(x-10,y,x+10,y-20);
  }
  
  void jump(){
    pushMatrix();
    translate(x,y-10);
    display();
    popMatrix();
  }
  
  void explode(){
    pushMatrix();
    translate(x,y-10);
    fill(#FF0000);
    float tx1,ty1,tx2,ty2;
    for (int r=0;r<30;r++){
      tx1=r*cos(0.8);
      ty1=r*sin(0.8);
      tx2=(r+6)*cos(0.8);
      ty2=(r+6)*sin(0.8);
      rect(tx1,ty1,tx2,ty2);
      rect(-tx1,ty1,-tx2,ty2);
      rect(tx1,-ty1,tx2,-ty2);
      rect(-tx1,-ty1,-tx2,-ty2);
    }
    popMatrix();
  }
  
  void initial(){
    p.x=0;
    p.y=height/3*2;
  }
}


