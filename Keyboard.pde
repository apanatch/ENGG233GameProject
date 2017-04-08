void keyPressed()
{
  fill(153);
  if (key == CODED) 
  {

    if (keyCode == LEFT && bx >= 0)
    {
      bx -= 15; //if the LEFT key is used, the pan moves to the LEFT at this speed
      stroke(100, 255, 100);
      moving_left = true; //moving left is TRUE, therefore the user cannot be moving RIGHT
      moving_right= false;
    } else if (keyCode == RIGHT && bx <= width)
    {
      bx += 15;
      stroke(100, 255, 100);
      moving_left = false;
      moving_right= true;
    }
  } else if (key == 'm' && (win == true || lose == true)) //if the current state of the game is at a WIN OR LOSS, the user can 
                                                          //hit the 'm' key to return back to the main menu, where win and lose are
                                                          //reset back to false so that the intro level can be displayed
  {
    win = false;
    lose = false;
  }
}