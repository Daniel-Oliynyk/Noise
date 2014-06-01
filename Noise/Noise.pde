import peasy.*;

float[][] map;
PeasyCam cam;

void setup() {
  size(600, 600, P3D);
  map = generate(600, 600);
  cam = new PeasyCam(this, 500);
  frameRate(40);
}

void draw() {
  background(204);
  lights();
  stroke(0);
  for (int x = 0; x < map.length; x++) {
    for (int y = 0; y < map[0].length; y++) {
      point(x, map[x][y], y);
    }
  }
}

void keyPressed() {
  noiseSeed(int(random(600)));
  map = generate(600, 600);
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
