import java.awt.*;

Map map = new Map(600, 300);
Player player = new Player();
ArrayList keys = new ArrayList();
int renderDistance = 2000;
int maxHeight = 300;

void setup() {
  size(600, 600, OPENGL);
  noiseDetail(3, 0.5);
  noStroke();
  noCursor();
  
  try {
    player.rob = new Robot();
  }
  catch (Exception e) {
    exit();
  }
}

void draw() {
  background(#5CAFF7);
  lights();
  player.update();
  
  fill(#1986E6);
  pushMatrix();
  translate(player.x, 300, player.z);
  box(renderDistance * 2, 275, renderDistance * 2);
  popMatrix();
  
  fill(#4BB509);
  int xInc = int(player.x - renderDistance) + 3 + abs(int((int(player.x - renderDistance) - player.x) / 30));
  for (int x = int(player.x - renderDistance); x < player.x + renderDistance; x += xInc) {
    xInc = 3 + abs(int((x - player.x) / 30));
    int zInc = int(player.z - renderDistance) + 3 + abs(int((int(player.z - renderDistance) - player.z) / 30));
    for (int z = int(player.z - renderDistance); z < player.z + renderDistance; z += zInc) {
      zInc = 3 + abs(int((z - player.z) / 30));
      beginShape(QUAD);
      vertex(x, noise(x * 0.01, z * 0.01) * maxHeight, z);
      vertex(x + xInc, noise((x + xInc) * 0.01, z * 0.01) * maxHeight, z);
      vertex(x + xInc, noise((x + xInc) * 0.01, (z + zInc) * 0.01) * maxHeight, z + zInc);
      vertex(x, noise(x * 0.01, (z + zInc) * 0.01) * maxHeight, z + zInc);
      endShape(CLOSE);
    }
  }
}

void keyPressed() {
  if (!keys.contains(keyCode)) keys.add(keyCode);
  if (keyCode == 70) map.generate(600, 300);
}

void keyReleased() {
  int index = keys.indexOf(keyCode);
  while (index != -1) {
    keys.remove(index);
    index = keys.indexOf(keyCode);
  }
  if (keyCode == 90) player.grab = player.grab? false: true;
}
