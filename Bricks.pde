void make_bricks () {
  for (int index = 0; index < rows; index ++)
  {
    for (int i = 0; i < col; i++)
    {
      if (level == 1) //level 1 brick pattern set up
      {
        bricks[index][i] = new Brick (); //constructing the object in the array
        bricks[index][i].x = 100 + i*(brickLength*2); //starting coordinates of bricks in level 1
        bricks[index][i].y = 100 + index*(brickHeight*2);
        bricks[index][i].appear = true; //the bricks are all present 
        bricks[index][i].destructible = true; //necessary because in level 2, some bricks are not destructible
      }
      if (level == 2) //level 2 brick pattern set up
      {
        bricks[index][i] = new Brick (); //constructing the object in the array
        bricks[index][i].appear = true;
        if (index == 0 && i!=1 || index == 2 && i!=1) //for these indices...
        {
          bricks[index][i].x = 200 + i*(brickLength); //starting coordinates of NON-DESTRUCTIBLE bricks in level 2
          bricks[index][i].y = 100 + index*(2*brickHeight);
          bricks[index][i].destructible = false; //these bricks are NOT DESTRUCTIBLE
        } else if (index == 1) { //these bricks ARE destructible
          bricks[index][i].x = 100 + i*(brickLength*2); //starting coordinates of DESTRUCTIBLE bricks in level 2
          bricks[index][i].y = 100 + index*(brickHeight*2);
          bricks[index][i].destructible = true;
        } else if (i==1) {
          bricks[index][i].appear = false; //do not draw these bricks 
        }
        bricks[index][i].dx = 0; //for all of them - the bricks DO NOT MOVE for levels 1 and 2
      }
      if (level == 3) //level 3 brick pattern set up
      {
        bricks[index][i] = new Brick (); //constructing the object in the array
        bricks[index][i].x = width/2-50; //starting coordinates of bricks in level 3
        bricks[index][i].y = 100 + index*(brickHeight*2); 
        bricks[index][i].appear = true;
        bricks[index][i].destructible = true;
        if (index == 0) //the row count; they all have the same column number 
        {
          bricks[index][i].dx = -6; //different speeds of the ball 
        } else if (index == 1)
        {
          bricks[index][i].dx = 2; 
        }
        else if (index == 2)
        {
          bricks[index][i].dx= -1;}
      }
    }
  }
}
void draw_bricks()
{
  for (int index = 0; index < rows; index +=1)
  {
    for (int i = 0; i < col; i+=1)
    {
      if (bricks[index][i].appear == true)
      {
        stroke (0);
        if (level==1) {
          fill (200, 0, 0); //level 1 bricks are colored red
        } else if (level ==2) {
          if (bricks[index][i].destructible == true)
          {
            fill (0, 200, 0); //level 2 destructible bricks are colored green
          } else
          {
            fill (200); //nonbreakable bricks are white
          }
        } else if (level == 3) 
        {
          fill(0, 0, 200); //level 3 bricks are colored blue 
        }
        rectMode(CORNER); //these bricks are drawn in the mode CORNER
        rect(bricks[index][i].x, bricks[index][i].y, brickLength, brickHeight);
      }
    }
  }
}
void updatebricks() //for level 3 brick movement
{
  for (int index = 0; index < rows; index +=1)
  {
    for (int i = 0; i < col; i+=1)
    {
      if (bricks[index][i].appear == true) //if the bricks have NOT yet been destroyed, then...
      {
        if (bricks[index][i].x + brickLength >= width || bricks[index][i].x <= 0) //once the brick's width (since it has been drawn by CORNER mode) 
                                                                                   //has reached the right OR left side of the screen, the brick will move 
                                                                                  //in the opposite direction it was moving before 
        {
          bricks[index][i].dx *=-1; //this changes the direction
        }
        bricks[index][i].x += bricks[index][i].dx; //we ADD the above change in direction to whatever rate the brick is currently moving  
      }
    }
  }
}