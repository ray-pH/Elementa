PImage logo;
PImage air, i_chara, i_chara1, i_chara_m, finish;
PImage i_block;
PImage cloud0, cloud1, cloud2, cloud3;
PImage grass_l, grass_m, grass_r;
PImage floaty_l, floaty_m, floaty_r, floaty_1;
PImage ground_l, ground_m, ground_r;
PImage endground_l, endground_m, endground_r;
PImage grass_l_x, grass_r_x;
PImage floaty_l_x, floaty_r_x, floaty_1_x;
PImage ground_l_x, ground_r_x;
PImage endground_l_x, endground_r_x;
PImage rock_floaty_1_x;
PImage water_s;
PImage nan;


void sprite_load(){
    logo        = loadImage("sprites/logo.png"      );
  
    nan         =  loadImage("sprites/nan.png"      );
    finish      =  loadImage("sprites/finish.png"   );
    i_chara     =  loadImage("sprites/chara.png"    );
    i_chara1    =  loadImage("sprites/chara1.png"    );
    i_chara_m   =  loadImage("sprites/chara_m.png"  );
    i_block     =  loadImage("sprites/block.png"    );
    air         =  loadImage("sprites/air.png"      );
    finish      =  loadImage("sprites/finish.png"   );
    cloud0      =  loadImage("sprites/cloud0.png"   );
    cloud1      =  loadImage("sprites/cloud1.png"   );
    cloud2      =  loadImage("sprites/cloud2.png"   );
    cloud3      =  loadImage("sprites/cloud3.png"   );
    floaty_l    =  loadImage("sprites/floaty_l.png"  );
    floaty_m    =  loadImage("sprites/floaty_m.png"  );
    floaty_r    =  loadImage("sprites/floaty_r.png"  );
    floaty_1    =  loadImage("sprites/floaty_1.png"  );
    grass_l     =  loadImage("sprites/grass_l.png"  );
    grass_m     =  loadImage("sprites/grass_m.png"  );
    grass_r     =  loadImage("sprites/grass_r.png"  );
    ground_l    =  loadImage("sprites/ground_l.png" );
    ground_m    =  loadImage("sprites/ground_m.png" );
    ground_r    =  loadImage("sprites/ground_r.png" );
    endground_l =  loadImage("sprites/endground_l.png");
    endground_m =  loadImage("sprites/endground_m.png");
    endground_r =  loadImage("sprites/endground_r.png");
    floaty_l_x  =  loadImage("sprites/floaty_l_x.png"  );
    floaty_r_x  =  loadImage("sprites/floaty_r_x.png"  );
    floaty_1_x  =  loadImage("sprites/floaty_1_x.png"  );
    grass_l_x   =  loadImage("sprites/grass_l_x.png"  );
    grass_r_x   =  loadImage("sprites/grass_r_x.png"  );
    ground_l_x  =  loadImage("sprites/ground_l_x.png" );
    ground_r_x  =  loadImage("sprites/ground_r_x.png" );
    endground_l_x =loadImage("sprites/endground_l_x.png");
    endground_r_x =loadImage("sprites/endground_r_x.png");
    
    rock_floaty_1_x  =  loadImage("sprites/rock_floaty_1_x.png"  );
    water_s     =  loadImage("sprites/water_still.png");
}