class Player {
  //Co-ordinates of player and looking direction
  float x, y, z;
  float perRadX, perRadY = PI / 2;
  
  //Controls mouse for player
  boolean grab = true;
  Robot rob;
  
  int speed = 10;
  
  void update() {
    //Finds where the player was looking before the mouse was pushed back to center
    float tempRadX = PI / 600 * (mouseX - 300);
    float headingX = (perRadX + tempRadX) % (PI * 2);
    //Temp is before mouse realigned, heading is both temp and permanent variables combined
    float tempRadY = PI / 600 * (mouseY - 300);
    float headingY = (perRadY + tempRadY) % (PI * 2);
    
    //Can't look lower than straight down or higher than straight up
    headingY = (headingY >= PI / 2)? PI / 2 - 0.0001 : headingY;
    headingY = (headingY <= (PI / 2) * -1)? (PI / 2) * -1 + 0.0001 : headingY;
    
    //Calculates in 2D where 500px from the looking angle is 
    float eyeX = 500 * cos(headingX);
    float eyeZ = 500 * sin(headingX);
    //Finds the value on 3D
    float eyeY = 500 * sin(headingY);
    float hyp = 500 * cos(headingY);
    
    //Corrects the values and makes them smaller so distance to eye focus point is always 500px 
    eyeX = eyeX * (hyp / 500);
    eyeZ = eyeZ * (hyp / 500);
    
    //Focuses the camera on the eye focus point
    camera(x, y, z, x + eyeX, y + eyeY, z + eyeZ, 0, 1, 0);
    
    //Pushes the mouse pack to the center of the screen and resets temporary variables
    Point mo = MouseInfo.getPointerInfo().getLocation();
    Point scr = getLocationOnScreen();
    if (grab) {
      //Temporary angle added to permanent then reset for x
      perRadX = perRadX + tempRadX;
      //If more than full rotation, remove extra angle
      perRadX = (perRadX > 2 * PI)? perRadX - 2 * PI : perRadX;
      tempRadX = 0;
      perRadY = perRadY + tempRadY;
      //Check again if looking too far down or too high up
      if (abs(perRadY) > PI / 2) perRadY = (perRadY > 0)? PI / 2 - 0.0001 : PI / 2 * -1 + 0.0001;
      tempRadY = 0;
      rob.mouseMove(scr.x + 300, scr.y + 300);
    }
    
    //Variables for walking direction and previous co-ordinates to reset to if collsion
    int xDir = 0, yDir = 0;
    float px = x, py = y, pz = z;
    
    //Space moves up and down
    if (keys.contains(32)) y -= speed;
    else if (keys.contains(16)) y += speed;
    
    //Determines horizontal direction in a 3x3 grid (0,0 is defualt)
    if (keys.contains(87)) xDir = 1;
    if (keys.contains(68)) yDir = -1;
    if (keys.contains(83)) xDir = -1;
    if (keys.contains(65)) yDir = 1;
    
    //If any of WASD is pressed, moves player
    if (abs(xDir) + abs(yDir) > 0) {
      //Checks angle to grid location, moves player there
      float walkAngle = headingX + (PI / -2 + atan2(xDir, yDir));
      x = x + (speed * cos(walkAngle));
      z = z + (speed * sin(walkAngle));
    }
    
    //Y has 50 added to it so player cannot see look bottom of map
    if (map.checkCollision(x, y + 50, z)) {
      //If player collides, resets to previous co-ordinates
      x = px;
      y = py;
      z = pz;
    }
  }
  
}
