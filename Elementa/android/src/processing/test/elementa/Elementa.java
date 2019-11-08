package processing.test.elementa;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Elementa extends PApplet {

int gridsize = 42;
int x_grid = 12;
int y_grid = 9;
float x_margin = 0;
float y_margin = 0;

public void setup(){
  
  orientation(LANDSCAPE);
  //size(1000,600);
  //surface.setResizable(true);
}

public void draw(){
  screenratio();
  background(0);
  fill(100,100,100);
  drawing_map();
  guidelines();
}

public void screenratio(){
  gridsize = min(height/y_grid,width/x_grid);
  x_margin = (width-x_grid*gridsize)/2;
  y_margin = (height-y_grid*gridsize)/2;
  translate(x_margin,y_margin);
}
public void guidelines(){
  //vertical
  strokeWeight(1);
  stroke(100);
  
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
Table maptable;

public void drawing_map(){
  
  String str;
  Table maptable = loadTable("map1.csv");
  Grids[] maptile = new Grids[x_grid*y_grid];
  for (int i = 0; i < 12 ; i = i+1) {
    for (int j = 0; j < 9 ; j = j+1) {
      str = maptable.getString(j,i);
      int n = j+y_grid*i;
      maptile[n] = new Grids(PApplet.parseInt(i*gridsize) ,PApplet.parseInt(j*gridsize), gridsize, str);
    }
  }
  for (int k = 0 ; k < maptile.length; k++) {
    maptile[k].display();
  }
}

class Grids{
  
  int x; int y; int wid; String col;
  
  Grids(int ix,int iy,int iwid, String icol){
    x = ix; y = iy; wid = iwid; col=icol;
  }
  
  public void display(){
    fill(10); noStroke(); 
    if (col.equals("1")){
      fill(255);
    }
    rect(x,y,wid,wid);
  }
  
}
  public void settings() {  size(displayWidth,displayHeight); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Elementa" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
