boolean click = false;
boolean release = false;
boolean hovering_back = false;

//main menu buttons//
class Button {
      float x, y, wid, hei;
      int num;
      PImage img;
      
      Button(float ix,float iy,float iw, float ih, PImage iimg, int inum){
        x = ix; y = iy; wid = iw; hei = ih; img = iimg; num = inum;}
      
      void check(){
        if((mouseX-x_margin>x-wid/2)&&(mouseX-x_margin<x+wid/2)&&(mouseY-y_margin>y-hei/2)&&(mouseY-y_margin<y+hei/2)){
          if (release == true) { release = false; menu = num; scr_factor = 0; }
          release = false; }}
      void display(){
        imageMode(CENTER);
        image(img,x,y,wid,hei);
        fill(0); text(num,x,y);
        check();
        imageMode(CORNER); }
}

//back to previous section//
class BackButton{
     float x,y, wid, hei;
     int num;
     PImage img;
     boolean hover;
     
     BackButton(float ix,float iy,float iw, float ih, PImage iimg){
        x = ix; y = iy; wid = iw; hei = ih; img = iimg;}
        
      void check(){
        if((mouseX-x_margin>x-wid/2)&&(mouseX-x_margin<x+wid/2)&&(mouseY-y_margin>y-hei/2)&&(mouseY-y_margin<y+hei/2)){
          hovering_back = true;
          if (release == true) { release = false; menu_back(); hovering_back = false; }
          release = false; } else { hovering_back = false; } }
      void display(){
        imageMode(CENTER);
        image(img,x,y,wid,hei);
        fill(0); text(num,x,y);
        check();
        imageMode(CORNER); }
}

class World_Button {
      float x, y, wid, hei, inx;
      int num;
      PImage img;
      
      World_Button(float ix,float iy,float iw, float ih, PImage iimg, int inum){
        x = ix; inx=ix; y = iy; wid = iw; hei = ih; img = iimg; num = inum; }
      void check(){
        x = inx+scr_world;
        if((mouseX-x_margin>x-wid/2)&&(mouseX-x_margin<x+wid/2)&&(mouseY-y_margin>y-hei/2)&&(mouseY-y_margin<y+hei/2)&&(!hovering_back)){
          if ((release == true)&&(abs(mouseX-mouse_x)<0.01)) { release = false; menu = 2; world = num; }
          release = false; } }
      void display(){
        imageMode(CENTER);
        image(img,x+scr_world,y,wid,hei);
        fill(0); text(num,x+scr_world,y);
        check();
        imageMode(CORNER);  }
}

class Level_Button {
      float x, y, wid, hei;
      int num;
      PImage img;
      
      Level_Button(float ix,float iy,float iw, float ih, PImage iimg, int inum){
        x = ix; y = iy; wid = iw; hei = ih; img = iimg; num = inum;  }
        
      void check(){
        if((mouseX-x_margin>x-wid/2)&&(mouseX-x_margin<x+wid/2)&&(mouseY-y_margin>y-hei/2)&&(mouseY-y_margin<y+hei/2)&&(!hovering_back)){
          if (release == true) { release = false; is_playing = true; is_paused = false; is_winning = false; map = num; load_map(); }
          release = false; }  }
      void display(){
        imageMode(CENTER);
        image(img,x,y,wid,hei);
        fill(0); text(num,x,y);
        check();
        imageMode(CORNER); }
}

class PauseMenu_Button {
      float x, y, wid, hei;
      int num;
      PImage img;
      boolean hover;
      
      PauseMenu_Button(float ix,float iy,float iw, float ih, PImage iimg, int inum){
        x = ix; y = iy; wid = iw; hei = ih; img = iimg; num = inum; }
        
      void check(){
        if((mouseX-x_margin>x-wid/2)&&(mouseX-x_margin<x+wid/2)&&(mouseY-y_margin>y-hei/2)&&(mouseY-y_margin<y+hei/2)){
          if (release == true) { release = false; whatdo(); } 
          release = false; }  }
      void whatdo(){
        if(num==0){ is_paused = false; } //resume
        if(num==1){ } //option
        if(num==2){ is_playing = false; is_paused = false; is_winning = false; menu = 2; init_map(); }  //tomainmenu   
        if(num==3){ is_playing = false; is_paused = false; is_winning = false; menu = 2; init_map(); load_map(); is_playing=true;}
        if(num==4){ }} //next level
      void display(){
        imageMode(CENTER);
        image(img,x,y,wid,hei);
        fill(0); text(num,x,y);
        check();
        imageMode(CORNER);  }
}