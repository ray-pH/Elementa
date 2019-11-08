int gridsize = 42;
int x_grid = 12;
int y_grid = 9;
float x_margin = 0;
float y_margin = 0;
float scr_factor = 0;
Table activemap;
int map = 1;
boolean is_playing = false;
boolean is_paused = false;
boolean is_winning = false;
boolean is_scrolling = false;

void setup(){
  //size(displayWidth,displayHeight,P2D);
  //orientation(LANDSCAPE);
  size(1000,600,P2D);
  surface.setResizable(true);
  sprite_load();
  frameRate(60);
  init_cloud();
  init_map();
  load_map();
  //frameRate(60);
}

void draw(){
  screenratio(); 
  background(84,150,252);
  fill(100,100,100);
  if(!is_playing){ guidelines(); menu(); is_paused = false; is_winning = false; }
  if(is_playing){
    draw_map();
    guidelines();
    controllines();
    if((is_paused)&&(!is_winning)){ pause_menu(); }
    if((is_paused)&&(is_winning)) { win_menu();   }
  }
  if(release) { release = !release; }
}


//adjusting grid size to screen size//
void screenratio(){
  gridsize = min(height/y_grid,width/x_grid);
  x_margin = (width-x_grid*gridsize)/2;
  y_margin = (height-y_grid*gridsize)/2;
  translate(x_margin,y_margin);
}

void keyPressed(){
  if(able_move) { move_key(); }
  if(key == 'q'){ is_playing=true; }
  if(key == BACKSPACE){ menu_back(); }
  if(key == ESC){ key = 0; menu_back(); }
  //if(is_pushing) { move_key(); }
}
void mousePressed(){
  if(able_move) { move_mouse(); }
  record_mouse();
  click = true;
}

void mouseReleased(){
  release = true;
}

void mouseClicked() {
  //click = true;
}
//void mouseWheel(MouseEvent event) {
//  float e = event.getCount();
//  scr_factor += e;
//}