import peasy.*;

PeasyCam cam;
Map map = new Map(600, 300);

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  noiseDetail(3, 0.5);
  frameRate(60);
}

void draw() {
  background(204);
  lights();
  stroke(0);
  for (int x = 0; x < map.points.length; x++) {
    for (int y = 0; y < map.points[0].length; y++) {
      point(x, map.points[x][y], y);
    }
  }
}

void keyPressed() {
  noiseSeed(int(random(600)));
  noiseDetail(3, 0.5);
  map.generate(600, 300);
}

