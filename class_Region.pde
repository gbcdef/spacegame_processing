class Region{
  int x,y,w,h;
  //(x,y) the bottom left corner of the region
  //w=width
  //h=height
  //ATTENTION:a translated coordinate!!!
  
  Region(int ttx,int tty,int ttw,int tth){
    x=ttx;
    y=tty;
    w=ttw;
    h=tth;
  }
  
  void display(){
    fill(0);
    rect(x,height/3*2-y,x+w,height/3*2-y-h);
  }
  
}
