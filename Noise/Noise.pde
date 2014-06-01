float[][] map;

void setup() {
  size(600, 600);
  map = generate(600, 255);
}

// test

void draw() {
  background(0);
  for (int x = 0; x < map.length; x++) {
    for (int y = 0; y < map[0].length; y++) {
      stroke(map[x][y]);
      point(x, y);
    }
  }
}

void keyPressed() {
  noiseSeed(int(random(255)));
  map = generate(600, 255);
}

float[][] generate(int square, int max) {
  float[][] output = new float[square][square];
  for (int x = 0; x < square; x++) {
    for (int y = 0; y < square; y++) {
      output[x][y] = noise(x * 0.01, y * 0.01) * max;
    }
  }
  return output;
}
