void draw_ball()
{
  fill (255);
  ellipseMode (CENTER);
  ellipse (b1.x, b1.y, b1.diam, b1.diam); //these parameters have been passed by value 
  
  if (level==3) { //draw ball 2 only for level 3
    ellipse (b2.x, b2.y, b2.diam, b2.diam);}
}
void update_ball() { //ball 1's x and y speed are updated here
  b1.x += b1.dx;
  b1.y += b1.dy;
 
  if (level == 3) { //ball 2's x and y speed are updated here, but only applicable for level 3
     
  b2.x += b2.dx;
  b2.y += b2.dy;}}