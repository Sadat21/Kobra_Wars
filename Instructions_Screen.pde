//This function creates the instructions menu
void instructions(int x,int y)    //Takes the width and height of the screen as parameters
{
  image(how_to,0,0,x,y);    //Prints the image of the instructions on the screem
    fill(0);  //Fill black
    noStroke();   //Take away the red stroke outline
    rect(0,y-75,x,75);  //Create a rectangle at the bottom of the screen
    fill(255);  //Font colour
    text("Back", 300,y-40);    //Print "Back" in the rectangle
    if( y-75 < mouseY && mousePressed)    //If the mouse is over the rectangle and pressed
    {
     instructions = false;    //Instuctions turn false therefore it goes back to the home screen
    }
    else if( y-75 < mouseY)    //If the mouse is just over the rectangle
    {
     fill(255,0,0,65);    //Red tint
     rect(0,y-75,x,75);    //Tint the rectangle red
    }
}
