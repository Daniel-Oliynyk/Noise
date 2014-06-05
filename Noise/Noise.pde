import java.awt.*;

Map map = new Map(600, 300);
Player player = new Player();
ArrayList keys = new ArrayList();

void setup() {
  size(600, 600, OPENGL);
  noiseDetail(3, 0.5);
  noCursor();
  fill(0, 100, 0);
  
  try {
    player.rob = new Robot();
  }
  catch (Exception e) {
    exit();
  }
}

void draw() {
  background(180);
  lights();
  stroke(0);
  player.update();
  
  for (int x = int(player.x - 300); x < player.x + 300; x += 5) {
    for (int z = int(player.z - 300); z < player.z + 300; z += 5) {
      beginShape();
      vertex(x, noise(x * 0.01, z * 0.01) * 300, z);
      vertex(x + 5, noise((x + 5) * 0.01, z * 0.01) * 300, z);
      vertex(x, noise(x * 0.01, z * 0.01, (z + 5) * 0.01) * 300, z + 5);
      vertex(x + 5, noise((x + 5) * 0.01, (z + 5) * 0.01) * 300, z + 5);
      endShape();
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
