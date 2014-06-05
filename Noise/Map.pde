class Map {
  
  Map(int square, int max) {
    generate(square, max);
  }
  
  void generate(int square, int max) {
    noiseSeed(int(random(255)));
  }
  
  boolean checkCollision(float x, float y, float z) {
    if (noise(x * 0.01, z * 0.01) * maxHeight < y) {
//      println(noise(x * 0.01, z * 0.01) * maxHeight, y);
      return true;
    }
    else return false;
  }
  
}
