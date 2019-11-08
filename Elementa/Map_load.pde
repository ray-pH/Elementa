Table map0, map1, map2, map3;

void init_map(){
  map0 = loadTable("maps/map0.csv");
  map1 = loadTable("maps/map1.csv");
  map2 = loadTable("maps/map2.csv");
  map3 = loadTable("maps/map3.csv");
  
}

void load_map(){
  activemap = map0;
  if (map==1) { activemap = map1; }
  if (map==2) { activemap = map2; }
  if (map==3) { activemap = map3; }
}