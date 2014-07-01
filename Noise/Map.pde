class Map {
  
  //Change for different computer speeds
  int renderDistance = 1200;
  int maxHeight = 300;
  int points = 100;
  
  Map() {
    generate();
  }
  
  //Creates a new seed on generation of map
  void generate() {
    noiseSeed(int(random(255)));
  }
  
  //Checks collision for map
  boolean checkCollision(float x, float y, float z) {
    if (noise(x * 0.01, z * 0.01) * maxHeight < y) {
      return true;
    }
    else return false;
  }
  
  //Draws the map
  void drawMap() {
    //Creates the water
    fill(#1986E6);
    pushMatrix();
    translate(player.x, 300, player.z);
    box(renderDistance * 2, 275, renderDistance * 2);
    popMatrix();
    
    fill(#4BB509);
    //Calculates points in a circle by changing angle and drawing point the radius distance from the player
    float scale = 2 * PI / points;
    for (int rad = 1; rad < renderDistance; rad += 20) {
      for (float i = 0; i < 2 * PI; i += scale) {
        //Calculates four points on quadralateral
        float x = player.x + sin(i) * rad;
        float z = player.z + cos(i) * rad;
        float x1 = player.x + sin(i + scale) * rad;
        float z1 = player.z + cos(i + scale) * rad;
        float x2 = player.x + sin(i + scale) * (rad + 20);
        float z2 = player.z + cos(i + scale) * (rad + 20);
        float x3 = player.x + sin(i) * (rad + 20);
        float z3 = player.z + cos(i) * (rad + 20);
        //Draws quadraletral
        beginShape(QUAD);
        vertex(x, noise(x * 0.01, z * 0.01) * maxHeight, z);
        vertex(x1, noise(x1 * 0.01, z1 * 0.01) * maxHeight, z1);
        vertex(x2, noise(x2 * 0.01, z2 * 0.01) * maxHeight, z2);
        vertex(x3, noise(x3 * 0.01, z3 * 0.01) * maxHeight, z3);
        endShape(CLOSE);
      }
    }
  }
}
