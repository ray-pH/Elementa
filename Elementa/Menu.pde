int menu = 0;
int world = 0;

void menu(){
  display_cloud();
  if (menu==0){ main_menu();      }
  if (menu==1){ world_selector(); }
  if (menu==2){ level_selector(); }
}

//called when back button is pressed
void menu_back() {
  if(!is_playing){
         if (menu==0){ }// exit(); }
    else if (menu==1){ menu = 0; }
    else if (menu==2){ menu = 1; } }
  else if(is_playing){
    is_paused = !is_paused;
  }
}

Button bt_play, bt_opt;

//main menu//
void main_menu(){
  float wid = 3*gridsize;
  float hei = gridsize;
  bt_play = new Button(gridsize*x_grid/2, gridsize*y_grid*5.5/9 , wid, hei, nan,1);
  bt_opt  = new Button(gridsize*x_grid/2, gridsize*y_grid*6.75/9 , wid, hei, nan,0);
  fill(255); stroke(0,115,200); strokeWeight(3);
  imageMode(CENTER);
  image(logo,x_grid*gridsize/2, gridsize*y_grid*0.28, gridsize*12, gridsize*2*12/7);
  imageMode(CORNER);
  bt_play.display();
  bt_opt.display();
}

float scr_world = 0;
World_Button world_a,world_b,world_c,world_d,world_e;
BackButton backbutton, backfromlevel;


//world  selector//
void world_selector(){
  pan();
  scr_world = scr_factor*20;
  float wid = gridsize*4;
  float hei = gridsize*(y_grid-1);
  backbutton = new BackButton(gridsize*x_grid-0.5*gridsize,0.8*gridsize,gridsize,gridsize,nan);
  world_a = new World_Button(wid/2+gridsize+ 0*(wid+gridsize),(gridsize*y_grid/2), wid, hei ,nan,1);
  world_b = new World_Button(wid/2+gridsize+ 1*(wid+gridsize),(gridsize*y_grid/2), wid, hei ,nan,2);
  world_c = new World_Button(wid/2+gridsize+ 2*(wid+gridsize),(gridsize*y_grid/2), wid, hei ,nan,3);
  world_d = new World_Button(wid/2+gridsize+ 3*(wid+gridsize),(gridsize*y_grid/2), wid, hei ,nan,4);
  world_a.display();
  world_b.display();
  world_c.display();
  world_d.display();
  backbutton.display();
}

//level selector//
void level_selector(){
  backfromlevel = new BackButton(gridsize*x_grid-0.5*gridsize,0.8*gridsize,gridsize,gridsize,nan);
  float dimen = 2*gridsize;
  float delta = gridsize/3;
  int na       = 8;
  int x_level = int((gridsize*x_grid-delta)/(dimen+2*delta))+1;
  int y_level = int((gridsize*y_grid-delta)/(dimen+2*delta))+1;
  float dim   = dimen;
  Level_Button[] level_buttons = new Level_Button[na];
  for (int j = 0; j < y_level; j++){
    for(int i = 0; i < x_level; i++){
      float x_lv = (dimen/2)+(i*(dimen+delta))+delta;
      float y_lv = (dimen/2)+(j*(dimen+delta))+3*delta;
      int n      = int(i + (j*(x_level)));
      //print(n);
      if( n < na ){
        level_buttons[n] = new Level_Button(x_lv,y_lv,dim,dim,nan,n+1);
      }
    }
  }
  for(int i = 0; i < level_buttons.length-1;  i++){
    level_buttons[i].display();
  }
  backfromlevel.display();
}


//game paused//
PauseMenu_Button resumebutton, optionbutton, menubutton, resetbutton;
void pause_menu(){
  resumebutton = new PauseMenu_Button(gridsize*2.25,gridsize*6,gridsize*2,gridsize*2,nan,0);
  optionbutton = new PauseMenu_Button(gridsize*4.75,gridsize*6,gridsize*2,gridsize*2,nan,1);
  menubutton   = new PauseMenu_Button(gridsize*7.25,gridsize*6,gridsize*2,gridsize*2,nan,2);
  resetbutton  = new PauseMenu_Button(gridsize*9.75,gridsize*6,gridsize*2,gridsize*2,nan,3);
  fill(0,0,0,70);
  rect(gridsize*0.5,gridsize,gridsize*(x_grid-1),gridsize*(y_grid-2));
  imageMode(CENTER);
  image(nan,gridsize*(x_grid/2), gridsize*3.5, gridsize*7, gridsize*2);
  imageMode(CORNER);
  resumebutton.display();
  optionbutton.display();
  menubutton.display();
  resetbutton.display();
}

//if level is complete
PauseMenu_Button menubuttonwin, resetbuttonwin, nextbutton;
void win_menu(){
  menubuttonwin  = new PauseMenu_Button(gridsize*3.5,gridsize*6,gridsize*2,gridsize*2,nan,2);
  resetbuttonwin = new PauseMenu_Button(gridsize*6,gridsize*6,gridsize*2,gridsize*2,nan,3);
  nextbutton     = new PauseMenu_Button(gridsize*8.5,gridsize*6,gridsize*2,gridsize*2,nan,4);
  fill(0,0,0,70);
  rect(gridsize,gridsize,gridsize*(x_grid-2),gridsize*(y_grid-2));
  imageMode(CENTER);
  image(nan,gridsize*(x_grid/2), gridsize*3.5, gridsize*7, gridsize*2);
  imageMode(CORNER);
  menubuttonwin.display();
  resetbuttonwin.display();
  nextbutton.display();
}


float mouse_x;
boolean event_pan = false;
float init_scr;

void record_mouse(){
  mouse_x = mouseX;
}

void pan(){
  if(mousePressed == true){
    float sc = mouseX - mouse_x;
    scr_factor = init_scr + sc*0.05;
  }else{
   init_scr = scr_factor; 
  }
}