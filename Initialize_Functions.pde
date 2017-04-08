void initialball() 
{
  b1.x = 120; //ball 1 is used for all three levels. Here, the starting x, y coordinates, its diameter, and its speed are given
  b1.y = 500;
  b1.diam = 40;
  b1.dx = 3;
  b1.dy = 3;
  
  b2.x = 100; //ball 2 is only used for level 3, but it technically exists in all levels since initialball is always called. However,
              //ball 2 only appears if level == 3, as coded by the if statement in "Ball" tab
  b2.y = 300; //ball 2 initial x, y coordinates, diameter, and its speed are given here
  b2.diam = 40;
  b2.dx = 2;
  b2.dy = 4;
  
}

void initial1() //this initializes level 1 data
{
  rows = 2; //in level 1, there are two rows, and three columns of bricks
  col = 3;
  numberofbricks = 6; //this is important for keeping track of how many destructible bricks remain - for purposes of winning and losing 
  initialball();      //the following levels call the same functions, but with different rows and columns of bricks. Each of which have a different set up described under "Bricks" tab for their creation.
  make_bricks();
  initialpan();
}

void initialpan() //this initializes the deflecting pan data, which is used for all three levels 
{
  bx = width/2;
  by = height- boxHeight/2;
}

void initial2() //this initializes level 1 data
{
  numberofbricks =3;
  rows = 3;
  col = 3;
  initialball();
  make_bricks();
  initialpan();
  
}

void initial3() //this initializes level 1 data
{
  numberofbricks = 3;
  rows = 3;
  col = 1;
  initialball();
  make_bricks();
  initialpan();
  
}