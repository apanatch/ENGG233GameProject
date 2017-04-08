//LEVEL DATA
int level;
boolean changed_level = false;
//BOX
float bx;               //starting x, y coordinates of the deflecting pan
float by;
int boxLength = 60; //length and height of deflecting pan
int boxHeight = 10;
//BRICKS
int brickLength = 100; 
int brickHeight = 50;
boolean moving_right = false; //initially setting the movement to false 
boolean moving_left = false;
//LEVEL DATA FOR DRAWING BRICKS
int rows;
int col;
//WIN OR LOSE DATA
int numberofbricks;
boolean win = false;
boolean lose = false;
PImage winpic;
PImage losepic;
class Ball {
  int x;
  int y;
  int diam;
  int dx;
  int dy;
}
class Brick {
  int x;
  int y;
  boolean appear;
  boolean destructible;
  int dx;
}
class UnbreakableBricks {
  int x;
  int y;
}
Ball b1 = new Ball (); //constructing object
Ball b2 = new Ball (); //constructing object
Brick [][] bricks = new Brick [4][6]; //constructing array, with a type defined by the user
UnbreakableBricks [] [] unbreakablebricks = new UnbreakableBricks [4][6]; //constructing array, with type defined by the user 
import ddf.minim.* ; //inserting sound file 
Minim minim;
AudioPlayer au_player1; //predefined class, given name to variable; respectively
void setup()
{
  size (700, 700);
  level = 0;
  minim = new Minim(this);
  au_player1 = minim.loadFile("Ball Bounce.mp3");
  
  winpic = loadImage("YOUWIN.png"); //uploading files to Processing
  losepic = loadImage ("YOULOSE.png");
  winpic.resize(width, height); //resizing image to fit the screen dimensions
  losepic.resize(width, height);
  
}
void draw ()
{
  if (level==0 && !win && !lose) { //at intro screen, there is no recorded win or loss yet
    intro();} //call the intro function to execute its function body
    
    else if (level > 0){ //if ANY of the three levels are clicked on, the following below will be called... They are common to each level
    background(0);
    draw_ball();
    draw_bricks();
    draw_rect();
    check_collisions();
    checkbrickcollisions();
    update_ball();
    updatebricks();
    checkwinorlose();
    
  }
  else if (win) //if the user wins, then the image of YOU WIN will be displayed. User has option to return to the main menu by pressing m. This is displayed on the screen.
  {
    image(winpic, 0, 0);
    textSize (25);
    text ("Press 'm' to return to the main menu", 135, 600);
    
  }
  else if (lose) //if the user loses, then the image of YOU LOSE will be displayed. User has option to return to the main menu by pressing m. This is displayed on the screen.
  {
    image(losepic, 0, 0);
    textSize (25);
     text ("Press 'm' to return to the main menu", 135, 600);
  }
  
}
void intro () { //for the intro screen, there are three options for the user to click on. Each option corresponds to the level that is displayed by the text.
  background (0);
  rectMode (CORNER);
  fill (200, 0, 0);
  rect (200, 250, 300, 100);
  fill (0, 200, 0);
  rect (200, 400, 300, 100);
  fill (0, 0, 200);
  rect (200, 550, 300, 100);
  stroke (255);
  fill (255);
  textSize (75);
  text("Brick Breaker", 113, 100); //title of the game at the top of the screen
  textSize (50);
  text("Level 1", 265, 320); //corresponding level name for each rectangle
  text("Level 2", 265, 470);
  text("Level 3", 265, 620);
}