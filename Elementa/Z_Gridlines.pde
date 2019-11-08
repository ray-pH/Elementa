void guidelines(){
  //vertical
  strokeWeight(1);
  stroke(100,100,100,50);
  
  int x = 0;
  for (int i = 0; i < x_grid+1 ; i = i+1) {
    line(x,0,x,gridsize*y_grid);
    x = x + gridsize;    
  }
  int y = 0;
  for (int i = 0; i < y_grid+1 ; i = i+1) {
    line(0,y,x_grid*gridsize,y);
    y = y + gridsize;    
  }
}
void controllines(){
  translate(-x_margin,-y_margin);
  strokeWeight(1);
  stroke(100,100,100,100);
  line(0,height/2,width,height/2);
  line(width/2,height/2,width/2,height);
  translate(x_margin,y_margin);
}

class Cloud {
  float x, y, s;
  int n;
  PImage img;
  Cloud(float ix, float iy,float is, int in){x = ix; y = iy; s = is; n = in;
        if (n==0){img = cloud0;}
   else if (n==1){img = cloud1;}
   else if (n==2){img = cloud2;}
   else if (n==3){img = cloud3;} }
  void move(){ float v = s; x += v; checkpos(); }
  void checkpos(){
    if (x>width-(x_margin/2)+5){ 
      x = -(x_margin/2)-3*gridsize;
      y = int(random(y_grid*gridsize));
    }
  }
  void display(){
    image(img, x, y, s*2*gridsize, s*gridsize);
  }  
}

class Clouds {
  Cloud[] clds = new Cloud[6];
  Clouds(){}
  void init(){
    for (int i = 0 ; i < clds.length; i++){
      int x = int(random(x_grid*gridsize));
      int y = int(random(y_grid*gridsize));
      float s = (random(0.7,1.5));
      int n = int(random(4));
      clds[i] = new Cloud(x,y,s,n);
    }
  }
  void display(){
    for (int i = 0 ; i < clds.length; i++){
      if(!is_paused){  clds[i].move(); }
      clds[i].display();
    }
  }
}

Clouds cld;
void init_cloud(){
  cld = new Clouds();
  cld.init();
}
void display_cloud(){
  cld.display();
}