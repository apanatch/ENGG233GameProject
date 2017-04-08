void mousePressed () {
  if (level == 0 && mouseX <= 500 && mouseX >= 200 && !win & !lose) { //if the mouse is pressed within these coordinates of the rectangle that indicates the level, 
                                                                      //and the current boolean state for win and lose is false (to prevent the player from making a 
                                                                      //selection OUTSIDE of the main screen), the user can rechoose their level
    if (mouseY <= 350 && mouseY >= 250) {
      level = 1;
      changed_level = true;
      initial1(); //introduces the setup for level 1; basically allows for "setup" to be run again; if these lines of code
                  //did not exist for level selection, the program would fail to work after playing once since setup only runs once
                  //here, each of these are put within setup so it essentially keeps getting called 
    }
    if (mouseY <= 500 && mouseY >= 400) {
      level = 2;
      changed_level = true;
      initial2();
    }
    if (mouseY <= 650 && mouseY >= 550) {
      level = 3;
      changed_level = true;
      initial3();
    }
  }
}