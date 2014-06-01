class Map {
  
  PShape terrain;
  
  Map(int square, int max) {
    generate(square, max);
    terrain = createShape();
  }
  
  void generate(int square, int max) {
    noiseSeed(int(random(255)));
    noiseDetail(3, 0.5);
    terrain.beginShape(QUAD);
    for (int x = 0; x < square; x++) {
      for (int y = 0; y < square; y++) {
        terrain.vertex(x, noise(x * 0.01, y * 0.01) * max, y);
      }
    }
    terrain.endShape(CLOSE);
  }
}
