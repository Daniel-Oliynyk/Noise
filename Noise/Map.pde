class Map {
  
  float[][] points;
  
  Map(int square, int max) {
    points = new float[square][square];
    generate(square, max);
  }
  
  void generate(int square, int max) {
    noiseSeed(int(random(255)));
    noiseDetail(3, 0.5);
    float[][] output = new float[square][square];
    for (int x = 0; x < square; x++) {
      for (int y = 0; y < square; y++) {
        points[x][y] = noise(x * 0.01, y * 0.01) * max;
      }
    }
  }
}
