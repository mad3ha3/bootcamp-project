float x, y, vx, vy, ballHit;
int leftColor, rightColor, radius, rectSize;
boolean startGame = false;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  x = 150;
  y = 150;
  vx = random(3, 5);
  vy= random(3, 5);
  leftColor = 255;
  rightColor = 255;
  rectSize = 150;
  ellipseMode(CENTER);
}

void draw() {
  background(#F29ACB);

  String s = "press spacebar to begin";
  fill(0);
  text(s, 50, 50, 290, 330);

  //draw ball
  fill(#7A98ED);
  radius = 20;
  ellipse(x, y, radius, radius);

  //draw bars
  fill(leftColor);
  rect(0, 0, 20, height);
  fill(rightColor);
  rect(width-30, mouseY-rectSize/2, 10, rectSize);

  if (startGame) {
    x += vx;
    y += vy;
    
    if ( x > width-30 && x < width -20 && y > mouseY-rectSize/2 && y < mouseY+rectSize/2 ) {     // if ball hits moving bar, change the x direction
      vx = vx * -1;
      x = x + vx;
      
      rightColor = 0;            //show effects
      fill(random(0, 128), random(0, 128), random(0, 128));
      ballHit = random(75, 150);
      ellipse(x, y, ballHit, ballHit);
      rectSize = rectSize-10;
      rectSize = constrain(rectSize, 10, 150);
      
    } else if (x < 25) {        //if ball hits the wall, change x direction
      vx = vx * -1.2;
      x = x + vx;
      leftColor = 0;
    } else {
      leftColor = 255;
      rightColor = 255;
    }
    
    if (x > width) {            // resets if you lose
      startGame = false;
      x = 150;
      y = 150;
      vx = random(3, 5);
      vy = random(3, 5);
      rectSize = 150;
    }
    
    if ( y > height || y < 0 ) {       // if ball hits top or bottom, change the y direction
      vy = vy * -1;
      y = y + vy;
    }
  }
}

void keyPressed() {
  if ( key == 32 )                   // 32 = spacebar
    startGame = true;
}
