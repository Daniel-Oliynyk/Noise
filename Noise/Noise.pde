import java.awt.*;

Map map = new Map(600, 300);
Player player = new Player();
ArrayList keys = new ArrayList();

void setup() {
  size(600, 600, P3D);
  noiseDetail(3, 0.5);
  noCursor();
  
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
  for (int x = 0; x < map.points.length; x++) {
    int yInc = 1;
    for (int y = 0; y < map.points[0].length; y = y + yInc) {
      point(x, map.points[x][y], y);
      yInc = int(dist(x, map.points[x][y], y, player.x, player.y, player.z)) / 100;
      if(yInc <= 0) yInc = 1;
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
