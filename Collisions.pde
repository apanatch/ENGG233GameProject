void check_collisions() { //this function checks for the collision between the ball and the deflecting pan at the lower boundary of the screen.
  if (b1.x <= bx + boxLength/2 && //if the ball (center x coordinate) is less than the right side of the pan
    b1.x >= bx - boxLength/2 && //if the ball (center x coordinate) is greater than the left side of the pan
    b1.y + b1.diam/2 <= by + boxHeight/2 && //if the bottom of the ball is less than or equal to the top of the deflecting pan (because its y coordinate plus half the height of the box gives the surface of the pan)
    b1.y + b1.diam/2 >= by - boxHeight/2) //if the bottom of the ball is greater than or equal to the bottom of the deflecting pan
  {
    if (moving_right) //this body of code here prevents the ball from being stuck in a repetitive path. If the ball hits something, its speed in the x direction will change; thus, its motion appears much more random.
      b1.dx++;
    else if (moving_left)
      b1.dx--;
    b1.dy= abs(b1.dy); 
  }
  if (b1.x - b1.diam/2 <= bx + boxLength/2 && //if the left side of the ball (center x coordinate minus the radius of the ball) is less than the right side of the deflecting pan (center y coordinate + half of the pan's length)
    b1.x >= bx - boxLength/2 && //if the ball (center x coordinate) is at a location to the right of the deflecting pan's left side 
    b1.y + b1.diam/2 >= by - boxHeight/2) //if the ball's bottom (y center coordinate + radius) reaches the surface of the deflecting pan
  {
    b1.dy =-abs(b1.dy); //the ball will bounce in the opposite direction to its movement when it is within the x coordinates of the deflecting pan
    
  }
  if (b1.x <= bx + boxLength/2 && //if the center of the ball is less or equal to the right side of the reflecting pan (at center allows for more ball catching leeway)
    b1.x + b1.diam/2 >= bx - boxLength/2 && //if the right side of the ball is equal to or is on the right of the pan (greater than the left side of the pan)
    b1.y + b1.diam/2 >= by - boxHeight/2) {  //if the ball's bottom is at the surface of the plate
    b1.dy =-abs(b1.dy); //the ball will deflect in the opposite direction 
    
  }
  if (b1.x + b1.diam/2 > width && b1.y <= height|| b1.x - b1.diam/2 < 0 && b1.y <= height) //this causes the ball to bounce off the upper boundary of the screen and the screen sides (width), as well as when the ball is caught at the bottom of the screen
    b1.dx *= -1;
  if (b1.y - b1.diam/2 < 0) //when the top of the ball hits the top of the screen, it must bounce back in the opposite direction it was going 
    b1.dy *= -1;
    
 
 //DEFLECTOR CORNERS: if the ball hits the two deflector corners it will bounce back in the opposite direction to the corner
  if (sqrt (sq (b1.x- (bx + boxLength/2)) + sq ((by - boxHeight/2)- b1.y))== b1.diam/2){  //the ball's x coordinate and y coordinates relative to the right corner of the deflector create a triangle whose hypotenuse is the ball's radius, the ball is at the deflectors corner and will bounce back
     b1.dx=abs(b1.dx);  //the ball bounces up and right
    b1.dy=-abs(b1.dy);}
    
  if (sqrt (sq ((bx - boxLength/2)- b1.x) + sq ((by - boxHeight/2) - b1.y))==b1.diam/2){ //the same concept applies to the left deflector corner
     b1.dx=-abs(b1.dx);  //the ball bounces up and left
    b1.dy=-abs(b1.dy);}
    
 
 
 
 //BALL TWO
 if (b2.x <= bx + boxLength/2 && //the exact same stipulations that apply to ball 1 apply to ball 2. Ball 2 only exists for level 3 because of the "if (level == 3)" condition under the Ball tab
    b2.x >= bx - boxLength/2 && 
    b2.y + b2.diam/2 <= by + boxHeight/2 && 
    b2.y + b2.diam/2 >= by - boxHeight/2) 
  {
    if (moving_right)
      b2.dx++;
    else if (moving_left)
      b2.dx--;
    b2.dy= abs(b2.dy);
  }
  if (b2.x - b2.diam/2 <= bx + boxLength/2 && 
    b2.x >= bx - boxLength/2 && 
    b2.y + b2.diam/2 >= by - boxHeight/2) 
  {
    b2.dy =-abs(b2.dy);
  }
  if (b2.x <= bx + boxLength/2 && 
    b2.x + b2.diam/2 >= bx - boxLength/2 && 
    b2.y + b2.diam/2 >= by - boxHeight/2) { 
    b2.dy =-abs(b2.dy);
  }
  if (b2.x + b2.diam/2 > width && b2.y <= height|| b2.x - b2.diam/2 < 0 && b2.y <= height)
    b2.dx *= -1;
  if (b2.y - b2.diam/2 < 0)
    b2.dy *= -1;
    
  //DEFLECTOR CORNERS BALL TWO
   if (sqrt (sq (b2.x- (bx + boxLength/2)) + sq ((by - boxHeight/2)- b2.y))== b2.diam/2){
     b2.dx=abs(b2.dx);
    b2.dy=-abs(b2.dy);}
    
  if (sqrt (sq ((bx - boxLength/2)- b2.x) + sq ((by - boxHeight/2) - b2.y))==b2.diam/2){
     b2.dx=-abs(b2.dx);
    b2.dy=-abs(b2.dy);}
    
}
void checkbrickcollisions() //this function checks for the rebounding of the ball off bricks; both breakable (levels 1, 2, 3) and unbreakable bricks (level 2)
{
  for (int index = 0; index < rows; index +=1) //a 2D array was employed for all levels in the creation of the breakable/nonbreakable bricks
  {
    for (int i = 0; i < col; i+=1)
    {
      if (bricks[index][i].appear) { //if the bricks are on the screen then:       //note: bricks are drawn by CORNER mode
        if (b1.x >= bricks[index][i].x && //if the ball is on the right side of the brick coordinates and 
          b1.x <= bricks[index][i].x + brickLength && //is less than the width of the brick on the right side
          b1.y - b1.diam/2 <= bricks[index][i].y + brickHeight && //top of the ball is below the brick 
          b1.y - b1.diam/2 >= bricks[index][i].y + brickHeight/2) //top of the ball is below the center of the brick
        {
          if (bricks[index][i].destructible == true) //if these bricks are meant to be destroyed, then...
          {
            numberofbricks--; //count for the number of bricks decreases every time the ball makes contact with a breakable brick --- will keep track of winning and losing 
            bricks[index][i].appear = false; //the bricks will disappear because they will no longer be drawn 
          }
          au_player1.play() ; //play sound when the ball makes contact 
          b1.dy =abs(b1.dy); //hit the bottom of the brick, so we want the ball deflected downwards once again; thus dy must be a POSITIVE value *NOTE: down = positive values for y grid
          au_player1.rewind(); //rewind the music file 
           
        }
        else if (b1.x >= bricks[index][i].x && //ball on the right side of the left corner of brick
          b1.x <= bricks[index][i].x + brickLength && //ball is at a position less than the right side of the brick
          b1.y + b1.diam/2 >= bricks[index][i].y && //when bottom of the ball is at a y position greater than the surface of the brick
          b1.y + b1.diam/2 <= bricks[index][i].y + brickHeight/2) //bottom of ball is at a position less than the bottom of the brick
        {
          if (bricks[index][i].destructible == true) //if these bricks are meant to be destroyed, then...
          {
            numberofbricks--; //the count for breakable bricks decreases (once number of bricks is zero, then the user has destroyed all breakable bricks
            bricks[index][i].appear = false; //the bricks are to be changed to false once hit, and will no longer be drawn
          }
          au_player1.play(); //play thud sound file 
          b1.dy =-abs(b1.dy); //want ball to go up since we are hitting from ABOVE the brick, so negative (keep in mind the y coordinate grid; up is negative!)
           au_player1.rewind(); //rewind sound file for later use
        }
       else if (b1.x +b1.diam/2 >= bricks[index][i].x && //if ball is passed the left side of the brick
          b1.x + b1.diam/2 <= bricks[index][i].x + brickLength/2 && //including the above condition, the ball is within the boundary of the brick's x coordinates
          b1.y <= bricks[index][i].y + brickHeight && //ball is above bottom of the brick
          b1.y >= bricks[index][i].y) //ball is at surface of brick
        {
          if (bricks[index][i].destructible == true)
          {
            numberofbricks--;
            bricks[index][i].appear = false;
          }
          au_player1.play();
          b1.dx = -abs(b1.dx); //hit from the left, rebound in the negative x direction
           au_player1.rewind();
        }
        else if (b1.x - b1.diam/2 >= bricks[index][i].x +brickLength/2 && //if the left side of the ball is to the center-right of the brick
          b1.x - b1.diam/2 <= bricks[index][i].x + brickLength && //but less than or equal to the right side of the brick
          b1.y <= bricks[index][i].y + brickHeight && //and the ball is above the bottom of the brick
          b1.y >= bricks[index][i].y) //but past the top of the brick
        {
          if (bricks[index][i].destructible == true)
          {
            numberofbricks--;
            bricks[index][i].appear = false;
          }
          au_player1.play();
          b1.dx = abs(b1.dx); //hit the right side; we want to rebound to the RIGHT side, so in the positive x direction
           au_player1.rewind();
          //for corners, make four if statements just like the above; take distance between corner and the middle of the ball; if that distance is equal to diameter/2 or less, then that means we are hitting the corner; distance sq rt b1.x - s.x squared + same for y ; always want the same outcome, using absolutes  
       }
  
  //BRICK CORNERS: 
  if (sqrt (sq(b1.x - (bricks[index][i].x + brickLength))+ sq(bricks[index][i].y-b1.y))==b1.diam/2) {//the ball's x coordinate and y coordinates relative to the top right corner of the brick create a triangle whose hypotenuse is the ball's radius, the ball is at the deflectors corner and will bounce back
    au_player1.play();
    b1.dx=abs(b1.dx); //the ball bounces up and right (away from corner)
    b1.dy=-abs(b1.dy);
  au_player1.rewind() ;}
  
  else if (sqrt (sq(bricks[index][i].x - b1.x) + sq(bricks[index][i].y-b1.y))== b1.diam/2) { //top left corner
    au_player1.play();
    b1.dx=-abs(b1.dx); //the ball bounces up and left
    b1.dy=-abs(b1.dy);
    numberofbricks--;
  au_player1.rewind() ;}
    
  else if (sqrt (sq (bricks[index][i].x - b1.x) + sq(b1.y-(bricks[index][i].y + brickLength)))== b1.diam/2){ //bottom left corner
    au_player1.play();
    b1.dx=-abs(b1.dx); //the ball bounces down and left
    b1.dy=abs(b1.dy);
    numberofbricks--;
  au_player1.rewind() ;}
    
  else if (sqrt (sq(b1.x- (bricks[index][i].x + brickLength)) + sq (b1.y - (bricks[index][i].y + brickHeight)))== b1.diam/2){ //bottom right corner
    au_player1.play();
    b1.dx=abs(b1.dx); //the ball bounces down and right
    b1.dy=abs(b1.dy);
    numberofbricks--;
  au_player1.rewind() ;}
  
 
  //BALL TWO
      if (bricks[index][i].appear) { //the same stipulations for ball 1 apply to ball 2 in regards to brick collisions. Note, ball 2 only exists in level 3 because of the if statement implemented.
        if (b2.x >= bricks[index][i].x &&
          b2.x <= bricks[index][i].x + brickLength &&
          b2.y - b2.diam/2 <= bricks[index][i].y + brickHeight &&
          b2.y - b2.diam/2 >= bricks[index][i].y + brickHeight/2)
        {
          if (bricks[index][i].destructible == true)
          {
            numberofbricks--;
            bricks[index][i].appear = false;
          }
          au_player1.play();
          b2.dy =abs(b2.dy); //hit the bottom of the brick
           au_player1.rewind() ;
        }
        else if (b2.x >= bricks[index][i].x &&
          b2.x <= bricks[index][i].x + brickLength &&
          b2.y + b2.diam/2 >= bricks[index][i].y &&
          b2.y + b2.diam/2 <= bricks[index][i].y + brickHeight/2)
        {
          if (bricks[index][i].destructible == true)
          {
            numberofbricks--;
            bricks[index][i].appear = false;
          }
          au_player1.play();
          b2.dy =-abs(b2.dy); //want ball to go up, so negative
           au_player1.rewind() ;
        }
        else if (b2.x +b2.diam/2 >= bricks[index][i].x &&
          b2.x + b2.diam/2 <= bricks[index][i].x + brickLength/2 &&
          b2.y <= bricks[index][i].y + brickHeight &&
          b2.y >= bricks[index][i].y)
        {
          if (bricks[index][i].destructible == true)
          {
            numberofbricks--;
            bricks[index][i].appear = false;
          }
          au_player1.play();
          b2.dx = -abs(b2.dx); //hit from the left
           au_player1.rewind() ;
        }
        else if (b2.x - b2.diam/2 >= bricks[index][i].x +brickLength/2 &&
          b2.x - b2.diam/2 <= bricks[index][i].x + brickLength &&
          b2.y <= bricks[index][i].y + brickHeight &&
          b2.y >= bricks[index][i].y)
        {
          if (bricks[index][i].destructible == true)
          {
            numberofbricks--;
            bricks[index][i].appear = false;
          }
          au_player1.play();
          b2.dx = abs(b2.dx); //hit the right side
           au_player1.rewind() ;
          //for corners, make four if statements just like the above; take distance between corner and the middle of the ball; if that distance is equal to diameter/2 or less, then that means we are hitting the corner; distance sq rt b1.x - s.x squared + same for y ; always want the same outcome, using absolutes  
        }
   
   
   //BRICK CORNERS FOR BALL TWO
       if (sqrt (sq(b2.x - (bricks[index][i].x + brickLength))+ sq(bricks[index][i].y-b2.y))==b2.diam/2) {
    au_player1.play();
    b2.dx=abs(b2.dx);
    b2.dy=-abs(b2.dy);
    numberofbricks--;
    au_player1.rewind() ;}
  
  else if (sqrt (sq(bricks[index][i].x - b2.x) + sq(bricks[index][i].y-b2.y))== b2.diam/2) {
    au_player1.play();
    b2.dx=-abs(b2.dx);
    b2.dy=-abs(b2.dy);
    numberofbricks--;
  au_player1.rewind() ;}
    
  else if (sqrt (sq (bricks[index][i].x - b2.x) + sq(b2.y-(bricks[index][i].y + brickLength)))== b2.diam/2){
    au_player1.play();
    b2.dx=-abs(b2.dx);
    b2.dy=abs(b2.dy);
    numberofbricks--;
  au_player1.rewind() ;}
    
  else if (sqrt (sq(b2.x- (bricks[index][i].x + brickLength)) + sq (b2.y - (bricks[index][i].y + brickHeight)))== b2.diam/2){
    au_player1.play();
    b2.dx=abs(b2.dx);
    b2.dy=abs(b2.dy);
    numberofbricks--;
  au_player1.rewind() ;}
      }
    }
    }
  }
}