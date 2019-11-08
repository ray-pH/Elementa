BackButton pause_bt;

//drawing map//
void draw_map(){
  pause_bt = new BackButton(gridsize*x_grid-0.5*gridsize,0.8*gridsize,gridsize,gridsize,nan);
  display_cloud();
  update_char();
  String str;
  display_finish();
  //getting string from each element of table, and then compare it//
  Grids[] maptile = new Grids[x_grid*y_grid];
  for (int i = 0; i < x_grid ; i = i+1) {
    for (int j = 0; j < y_grid ; j = j+1) {
      str = activemap.getString(j,i);
      int n = j+y_grid*i;
      maptile[n] = new Grids(int(i*gridsize) ,int(j*gridsize), gridsize, str);
    }
  }
  for (int k = 0 ; k < maptile.length; k++) {
    maptile[k].display();
  }
  pause_bt.display();
}



class Grids{
  
  
  int x; int y; int wid; String col;
  
  Grids(int ix,int iy,int iwid, String icol){
    x = ix; y = iy; wid = iwid; col=icol;
  }
  
  void display(){
    PImage img;
    img = air;
    fill(10); noStroke(); 
         if (col.equals("1")){ img = grass_l; } 
    else if (col.equals("2")){ img = grass_m; }
    else if (col.equals("3")){ img = grass_r; }
    else if (col.equals("4")){ img = ground_l; }
    else if (col.equals("5")){ img = ground_m; }
    else if (col.equals("6")){ img = ground_r; }
    else if (col.equals("7")){ img = endground_l; }
    else if (col.equals("8")){ img = endground_m; }
    else if (col.equals("9")){ img = endground_r; }
    else if (col.equals("10")){ img = floaty_1; }
    
    else if (col.equals("1x")){ img = grass_l_x; } 
    else if (col.equals("3x")){ img = grass_r_x; }
    else if (col.equals("4x")){ img = ground_l_x; }
    else if (col.equals("6x")){ img = ground_r_x; }
    else if (col.equals("7x")){ img = endground_l_x; }
    else if (col.equals("9x")){ img = endground_r_x; }
    else if (col.equals("10x")){ img = floaty_1_x; }
    
    else if (col.equals("r10x")){ img = rock_floaty_1_x; }
    
  else if (col.equals("c")){ img = i_chara; }
    
    
    else if (col.equals("c_")){ img = i_chara_m; }
    else if (col.equals("b")){ img = i_block; }
    else if (col.equals("w")){ img = water_s; }
    image(img, x, y, gridsize, gridsize);
  }
  
}