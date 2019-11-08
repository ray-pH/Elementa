int win_x;
int win_y;
int ch_x;
int ch_y;
int ch_or = 0; //0 is right
int n_block = 0;
float anim_t = 5;
boolean able_move = true;
int[] move_queue = new int[0];
Table[] undo_table = new Table[1];
Table[] redo_table = new Table[1];


void update_char(){
  String str;
    //looking for char's coordinate
    for (int i = 0; i < x_grid ; i = i+1) {
      for (int j = 0; j < y_grid ; j = j+1) {
        str = activemap.getString(j,i);
        if ((str.equals("c"))||(str.equals("c_"))) { ch_x = i; ch_y = j; } 
        if (str.equals("f")) { win_x = i; win_y = j; activemap.setString(j,i,"0"); } } }
   check_char();
   check_block();
   if((move_queue.length>0)){move(); move_queue = reverse(move_queue); move_queue = shorten(move_queue); move_queue = reverse(move_queue);}
   anim_t++;
   //print(is_pushing);
}

void display_finish(){
  image(finish, win_x*gridsize, win_y*gridsize, gridsize, gridsize);
}

boolean able_right = true;
boolean able_left = true;
boolean able_upright = true;
boolean able_upleft = true;
boolean able_up = true;
boolean able_jump = true;
boolean onground = true;
boolean is_pushing = false;
boolean able_push = false;

void check_char(){
  String toright   = "";
  String toleft    = "";
  String toupright = "";
  String toupleft  = "";
  String toup      = "";
  String tobot     = "";
  if ( ch_y > 0 )                { toup        = activemap.getString(ch_y-1,ch_x); }
  if ( ch_y < y_grid-1 )         { tobot       = activemap.getString(ch_y+1,ch_x); }
  if ( ch_x < x_grid-1 )         { toright     = activemap.getString(ch_y,ch_x+1); }
  if ( ch_x > 0 )                { toleft      = activemap.getString(ch_y,ch_x-1); }
  if ((ch_y>0)&&(ch_x<x_grid-1)) { toupright   = activemap.getString(ch_y-1,ch_x+1); }
  if ((ch_y>0)&&(ch_x>0))        { toupleft    = activemap.getString(ch_y-1,ch_x-1); }
  if (check_notsolid(toright))   { able_right=true;   } else { able_right=false;   }
  if (check_notsolid(toleft))    { able_left=true;    } else { able_left=false;    }
  if (check_notsolid(toupleft))  { able_upleft=true;  } else { able_upleft=false;  }
  if (check_notsolid(toupright)) { able_upright=true; } else { able_upright=false; }
  if (check_notsolid(toup))      { able_up=true;      } else { able_up=false;      }
  if (check_notsolid(tobot))     { onground=false;    } else { onground=true;      }
  if (!onground) { movedown(); } else { able_jump = true; }
  if ((win_x==ch_x)&&(win_y==ch_y)){ is_paused=true; is_winning = true; } else { is_winning = false; }
}
void check_block(){
  String toright   = "";
  String toright2  = "";
  String toright3  = "";
  String toleft    = "";
  String toleft2   = "";
  String toleft3   = "";
  if ( ch_x < x_grid-1 ) { toright     = activemap.getString(ch_y,ch_x+1); }
  if ( ch_x < x_grid-2)  { toright2    = activemap.getString(ch_y,ch_x+2); }
  if ( ch_x < x_grid-3)  { toright3    = activemap.getString(ch_y,ch_x+3); }
  if ( ch_x > 0 )        { toleft      = activemap.getString(ch_y,ch_x-1); }
  if ( ch_x > 1 )        { toleft2     = activemap.getString(ch_y,ch_x-2); }
  if ( ch_x > 2 )        { toleft3     = activemap.getString(ch_y,ch_x-3); }
       if ((check_block(toright))&&(ch_or==0))  { is_pushing=true;    }
  else if ((check_block(toleft ))&&(ch_or==1))  { is_pushing=true;    } 
  else    { is_pushing=false;    }
  
  if (is_pushing){
    toright   = get_block_state(toright);
    toright2  = get_block_state(toright2);
    toright3  = get_block_state(toright3);
    toleft    = get_block_state(toleft);
    toleft2   = get_block_state(toleft2);
    toleft3   = get_block_state(toleft3);
         if ((ch_or==0)&&((check_block_state(toright+toright2+toright3)))){ able_push = true; }
    else if ((ch_or==1)&&((check_block_state(toleft +toleft2 +toleft3 )))){ able_push = true; }
    else    { able_push = false; }
  } else    { able_push = false; }
  gravity_block();
}
void gravity_block(){
  String str;
    for (int i = 0; i < x_grid ; i = i+1) {
      for (int j = 0; j < y_grid ; j = j+1) {
        str = activemap.getString(j,i);
        if (check_block(str)) { 
          String ground = "";
          if ( j < y_grid-1 ){ ground = activemap.getString(j+1,i); }
          if ( check_notsolid(ground) ){ activemap.setString(j,i,"0");activemap.setString(j+1,i,str); }
        } 
      } 
    }
}

void move_mouse(){
  if((is_playing)&&(!is_paused)){
    if(!is_pushing){
      if     ( mouseY < height/2 ){ move_queue = append(move_queue,2);  }
      else if( mouseX < width/2  ){ move_queue = append(move_queue,1);  }
      else if( mouseX > width/2  ){ move_queue = append(move_queue,0);  } }
    else {
      if     ( mouseY < height/2 ){ move_queue = append(move_queue,5);  }
      else if( mouseX < width/2  ){ move_queue = append(move_queue,4);  }
      else if( mouseX > width/2  ){ move_queue = append(move_queue,3);  } }
  }
}  
void move_key(){
  if((is_playing)&&(!is_paused)){
    if(!is_pushing){
      if( keyCode==RIGHT ){ move_queue = append(move_queue,0); }
      if( keyCode==LEFT ) { move_queue = append(move_queue,1); }
      if( keyCode==UP )   { move_queue = append(move_queue,2); } }
    else {
      if( keyCode==RIGHT ){ move_queue = append(move_queue,3); }
      if( keyCode==LEFT ) { move_queue = append(move_queue,4); }
      if( keyCode==UP )   { move_queue = append(move_queue,5); } }
  }
}

void move(){
  if(onground){
    if(move_queue[0]==0){ if ( ( ch_or == 0 )&&(able_right)) { moveright();return; } else if ( ch_or == 1 ) { ch_or = 0; rotateright(); return;} }
    if(move_queue[0]==1){ if ( ( ch_or == 1 )&&(able_left))  { moveleft(); return; } else if ( ch_or == 0 ) { ch_or = 1; rotateleft(); return;} }
    if(move_queue[0]==2){ if (able_jump) { able_jump = false;
                          if ( ( ch_or == 0 )&&(able_upright) ) { moveupright(); return;}  
                     else if ( ( ch_or == 1 )&&(able_upleft ) ) { moveupleft();return; } 
                     else if (able_up){ moveup();return; } } }
   if(move_queue[0]==3){ if ( ( ch_or == 0 )&&(able_push)) { pushright();return; } else if ( ch_or == 1 ) { ch_or = 0; rotateright(); return;} }
   if(move_queue[0]==4){ if ( ( ch_or == 1 )&&(able_push))  { pushleft(); return; } else if ( ch_or == 0 ) { ch_or = 1; rotateleft(); return;} } 
   if(move_queue[0]==5){ if (able_jump) { able_jump = false;
                          if ( ( ch_or == 0 )&&(able_upright) ) { moveupright(); return;}  
                     else if ( ( ch_or == 1 )&&(able_upleft ) ) { moveupleft();return; } 
                     else if (able_up){ moveup();return; } } } }
}

  
void move_anim()   { anim_t = 0; }
void rotateright() { activemap.setString(ch_y,ch_x,"c"); move_anim();}
void rotateleft()  { activemap.setString(ch_y,ch_x,"c_"); move_anim();}
void moveright()   { activemap.setString(ch_y,ch_x,"0"); activemap.setString(ch_y,ch_x+1,"c"); move_anim();}
void moveleft()    { activemap.setString(ch_y,ch_x,"0"); activemap.setString(ch_y,ch_x-1,"c_"); move_anim();}
void moveupright() { activemap.setString(ch_y,ch_x,"0"); activemap.setString(ch_y-1,ch_x+1,"c"); move_anim();}
void moveupleft()  { activemap.setString(ch_y,ch_x,"0"); activemap.setString(ch_y-1,ch_x-1,"c_"); move_anim();}
void moveup()      { activemap.setString(ch_y,ch_x,"0"); if(ch_or==0){activemap.setString(ch_y-1,ch_x,"c");move_anim();}
                                                         else        {activemap.setString(ch_y-1,ch_x,"c_");move_anim();} }
void movedown()    { activemap.setString(ch_y,ch_x,"0"); if(ch_or==0){activemap.setString(ch_y+1,ch_x,"c");move_anim();}
                                                         else        {activemap.setString(ch_y+1,ch_x,"c_");move_anim();} }
void pushright()   { if(n_block==1){ String block = activemap.getString(ch_y,ch_x+1); 
                                     activemap.setString(ch_y,ch_x,"0"); activemap.setString(ch_y,ch_x+1,"c"); 
                                     activemap.setString(ch_y,ch_x+2,block); move_anim(); }
                else if(n_block==2){ String block1 = activemap.getString(ch_y,ch_x+1);  String block2 = activemap.getString(ch_y,ch_x+2);
                                     activemap.setString(ch_y,ch_x,"0"); activemap.setString(ch_y,ch_x+1,"c"); 
                                     activemap.setString(ch_y,ch_x+2,block1); activemap.setString(ch_y,ch_x+3,block2);move_anim(); } }
void pushleft()    { if(n_block==1){ String block = activemap.getString(ch_y,ch_x-1); 
                                     activemap.setString(ch_y,ch_x,"0"); activemap.setString(ch_y,ch_x-1,"c_"); 
                                     activemap.setString(ch_y,ch_x-2,block); move_anim(); }
                else if(n_block==2){ String block1 = activemap.getString(ch_y,ch_x-1);  String block2 = activemap.getString(ch_y,ch_x-2);
                                     activemap.setString(ch_y,ch_x,"0"); activemap.setString(ch_y,ch_x-1,"c_"); 
                                     activemap.setString(ch_y,ch_x-2,block1); activemap.setString(ch_y,ch_x-3,block2);move_anim(); } }                                                         



boolean check_notsolid(String str){
  if (str.equals("0")){ return true; }
  return false;
}
boolean check_block(String str){
  if (str.equals("b")){return true; }
  return false;
}
boolean check_block_state(String str){
  if (str.substring(0,2).equals("b0")) { n_block = 1; return true; }
  if (str.equals("bb0")) { n_block = 2; return true; }
  n_block = 0; return false;
}
String get_block_state(String str){
  if(check_notsolid(str)) { return "0"; } else if(check_block(str)) { return "b";  } else { return "1";  }
}