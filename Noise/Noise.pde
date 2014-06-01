float[][] map;

void setup() {
  size(255, 255);
  map = generate(255);
}

void draw() {
  background(0);
  for (int x = 0; x < 255; x++) {
    for (int y = 0; y < 255; y++) {
      stroke(map[x][y]);
      point(x, y);
    }
  }
}

void keyPressed() {
  noiseSeed(int(random(255)));
  map = generate(255);
}

float[][] generate(int cube) {
  float[][] output = new float[cube][cube];
  for (int x = 0; x < cube; x++) {
    for (int y = 0; y < cube; y++) {
      output[x][y] = noise(x * 0.01, y * 0.01) * cube;
    }
  }
  return output;
}
