import java.awt.*;

Map map = new Map(600, 300);
Player player = new Player();
ArrayList keys = new ArrayList();
int renderDistance = 600;
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
  for (int x = int(player.x - renderDistance); x < player.x + renderDistance; x += 5) {
    for (int z = int(player.z - renderDistance); z < player.z + renderDistance; z += 5) {
      beginShape(QUAD);
      vertex(x, noise(x * 0.01, z * 0.01) * maxHeight, z);
      vertex(x + 5, noise((x + 5) * 0.01, z * 0.01) * maxHeight, z);
      vertex(x + 5, noise((x + 5) * 0.01, (z + 5) * 0.01) * maxHeight, z + 5);
      vertex(x, noise(x * 0.01, (z + 5) * 0.01) * maxHeight, z + 5);
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
