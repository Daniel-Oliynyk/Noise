class Map {
  
  Map(int square, int max) {
    generate(square, max);
  }
  
  //Creates a new seed on generation of map
  void generate(int square, int max) {
    noiseSeed(int(random(255)));
  }
  
  //Checks collision for map
  boolean checkCollision(float x, float y, float z) {
    if (noise(x * 0.01, z * 0.01) * maxHeight < y) {
      return true;
    }
    else return false;
  }
  
}
