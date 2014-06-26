import java.awt.*;

Map map = new Map(600, 300);
Player player = new Player();
ArrayList keys = new ArrayList();


void setup() {
  size(600, 600, OPENGL);
  //Adjust for smoother or sharper terrain
  noiseDetail(3, 0.5);
  noStroke();
  noCursor();
  
  //Moves mouse to the middle of the screen
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
  
  //Draws the map
  map.drawMap();
}

void keyPressed() {
  //Puts keys in array
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
