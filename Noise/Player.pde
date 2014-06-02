class Player {

  float x = 300, y = -300, z = 300;
  float perRadX, perRadY = PI / 2;
  
  boolean grab = true;
  Robot rob;
  
  void update() {
    float tempRadX = PI / 600 * (mouseX - 300);
    float headingX = (perRadX + tempRadX) % (PI * 2);
    println((PI / 2) % (PI * 2));
    
    float tempRadY = PI / 600 * (mouseY - 300);
    float headingY = (perRadY + tempRadY) % (PI * 2);
    
    headingY = (headingY >= PI / 2)? PI / 2 - 0.0001 : headingY;
    headingY = (headingY <= (PI / 2) * -1)? (PI / 2) * -1 + 0.0001 : headingY;
    
    float eyeX = 500 * cos(headingX);
    float eyeZ = 500 * sin(headingX);
    
    float eyeY = 500 * sin(headingY);
    float hyp = 500 * cos(headingY);
    
    eyeX = eyeX * (hyp / 500);
    eyeZ = eyeZ * (hyp / 500);
    
    camera(x, y, z, x + eyeX, y + eyeY, z + eyeZ, 0, 1, 0);
    
    Point mo = MouseInfo.getPointerInfo().getLocation();
    Point scr = getLocationOnScreen();
    if (grab) {
      perRadX = perRadX + tempRadX;
      tempRadX = 0;
      perRadY = perRadY + tempRadY;
      if (abs(perRadY) > PI / 2) perRadY = (perRadY > 0)? PI / 2 - 0.0001 : PI / 2 * -1 + 0.0001;
      tempRadY = 0;
      rob.mouseMove(scr.x + 300, scr.y + 300);
    }
    
    int xDir = 0, yDir = 0;
    
    if (keys.contains(32)) y -= 20;
    else if (keys.contains(16)) y += 20;
    
    if (keys.contains(87)) xDir = 1;
    if (keys.contains(68)) yDir = -1;
    if (keys.contains(83)) xDir = -1;
    if (keys.contains(65)) yDir = 1;
    
    if (abs(xDir) + abs(yDir) > 0) {
      float walkAngle = headingX + (PI / -2 + atan2(xDir, yDir));
      x = x + (20 * cos(walkAngle));
      z = z + (20 * sin(walkAngle));
    }
  }
  
}
