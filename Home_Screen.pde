//This function creates all aspects of the home screen
void home_screen()   
{
    
    image(intro_screen,0,0,width,height);      //Puts image of the intro screen at the given coordinates
    intro.play();          //Start the home screen music
          
    
    image(level,width/3,height -100,width/3,50);      //Puts the image of "SPEED" on the home screen
    
    
    //Level 1
    fill(#C2D1D0);  //Fill the rectangle blue            
    rect(0,height - 50,width/3,50);      //Print rectangle to the bottom left of the screen
    fill(0);    //Colour of font
    textFont(font,32);    //Font style and size
    text("Slow",75,height - 15);    //Prints "Slow" to the screen in the rectangle 
    if( 0 < mouseX && mouseX < width/3 && height - 50 < mouseY && mouseX < height && mousePressed)    //If the mouse is on the rectangle and the mouse is pressed
    {
      speed = 2;        //spped gets intialized to 2
      fill(250,0,0);    //Colour of the rectangle
      rect(0,height - 50,width/3,50);    //Prints rectangle to the screen that disapears after mouse is released
      level_1=true;        //Re-assigns these values
      level_2=false;
      level_3=false;
    }
    
    //Level 2
    fill(#C2D1D0);   //Colour of rectangle                     
    rect(width/3,height -50,width/3,50);      //Prints rectangle in the center of the bottom part of the screen
    fill(0);    //Colour of font
    textSize(32);  //Size of text
    text("Normal",290,height - 15);    //Prints "Normal" within the rectangle
    if( width/3 < mouseX && mouseX < width/3*2 && height - 50 < mouseY && mouseY < height && mousePressed)    //If the mosue coordinates are within the rectangle and mouse is pressed
    {
      speed = 4;    //Speed is re-assigned to 4
      fill(250,0,0);    //Colour of the rectangle
      rect(width/3,height -50,width/3,50);      //Red rectangle flashes 
      level_1=false;    //Re-assigns these variables
      level_2=true;
      level_3=false;
    }
    
    
    //Level 3
    fill(#C2D1D0);     //Colour of rectangle is blue
    rect(width/3*2,height - 50 ,width/3,50);    //Draw rectangle in the bottom right of the screen
    fill(0);     //Colour of font
    textSize(32);    //Size of font 
    text("Fast",550,height - 15);      //Write "Fast" within the rectangle
    if( width/3*2 < mouseX && mouseX < width && height - 50 < mouseY && mouseY < height && mousePressed)      //If the mosue coordinates are within the rectangle and mouse is pressed
    {
      speed = 6;    //Speed is re-assigned to 4
      fill(250,0,0);    //Colour of the rectangle
      rect(width/3*2,height - 50 ,width/3,50);      //Red rectangle flashes 
      level_1=false;        //Re-assigns these variables
      level_2=false;
      level_3=true;
    }
    
    if (level_2)      //If level_2 is true
    {
      fill(250,0,0,90);                          //Fill that rectangle with a tinted red tint 
      rect(width/3,height -50,width/3,50);
    }
    else if (level_1)        //Else do above for level_1 and level_2 respectively based on which variable is true
    {
      fill(250,0,0,90);
      rect(0,height -50,width/3,50);
    }
    else if (level_3)
    {
      fill(250,0,0,90);
      rect(width/3*2,height - 50 ,width/3,50);
    }
    
    
    //Instructions Button
    rect(width/3,0,width/3,50);    //Draw rectangle at the top of the screen
    image(manual,width/3 +1,0,width/3-1,50+1);    //Image of instructions logo
    if( width/3 < mouseX && mouseX < width/3 + width/3 && mouseY < 50 && mousePressed)     //If the bouse cursor is over the instructions button and pressed
    {
     instructions = true;      //The instructions button appears
    }
    else if( width/3 < mouseX && mouseX < width/3 + width/3 && mouseY < 50)         //If the cursor is over it but no button is pressed
    {
     fill(255,0,0,65);    //Red tint
     rect(width/3,0,width/3,50);    //Fill rectangle when cursor is over it
    }  
    
    
    
    //Play Button
    rect(232,300,234,50);      //Rectangle for the play button   
    stroke(250,0,0);          //Outlines the rectangle in red
    image(play,width/3,280,width/3,90);      //Image of the play button
    if( 232 < mouseX && mouseX < 466 && 280 < mouseY && mouseY < 370 && mousePressed)    //If the mouse is over the button and pressed
     {
      background(0);    //Change background to black
      game = true;      //Game = true
     }
    else if( 232 < mouseX && mouseX < 466 && 280 < mouseY && mouseY < 370 )     //IF the mouse is over the button
     {
      fill(250,0,0,65);      //Tint red
      rect(232,300,234,50);    //Create a rectangle over the button
     }
    
    
      
}