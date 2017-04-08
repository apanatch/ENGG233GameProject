void checkwinorlose ()
{
  if (numberofbricks == 0) //once the brick count gets to 0, the user wins because in destroying all bricks, it is known that the user has caught the ball successively
  {
    win = true;
    level = 0;
  } else if (b1.y > height || b2.y > height) //if the ball goes out of the lower screen, the user loses, and level 0 is prompted... and thus, the introduction screen is displayed and the user can make a selection
  {
    lose = true;
    level = 0;
  }
}