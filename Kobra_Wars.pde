// Kobra_Wars.pde
//Author: Sadat Islam
//Date: December 1, 2015

//NOTE: FFI: Function found in

/* This program is a 2 player game of snake(kobra). This is for my ENGG 233 final design project.
    This is setup and draw of my game. I make function calls throughout.
*/

void setup()                    //All functions that are called are found in "Setup_Functions" tab
{
  frameRate(120);              //Cycles of Draw per second.
  setup_size_variables();      //Function intializes kobra locations
  setup_images();              //Intializes image files
  setup_audio();               //Intializes audio files
}

/* Runs in a continous loop
*/

void draw()
{
                           
  if (game==false && instructions==false)    //If variables game and instructions are false
    {                                        // Then the main home screen appears
      home_screen();                   //FFI: "Home_Screen" tab
    }
  if(instructions)                           //If instructions is ever true, the instructions screen appears
    {
     instructions(width,height);             //FFI: "Instructions_Screen" tab.
    }
  if(game)                // If game is ever true, the game starts
    {
     
     pre_game();     //FFI: "Pre_and_Post_Game" tab      Pre_game starts the audio and creats a new storage array
     if(end)              
     {
       result();      //If end is true, this function displays the winner of the game
       restart();
     }
     else                  //If end is not true, the game continues
     {
       border(x,y,h,v,width,height);      //FFI: Death_Error    Function responsible for causing a game over if any kobra hits the border
       user_control();                    //FFI: User_Control    Controls user controls for both players
       update_locations (all,x,y,h,v);    //FFI: Array_Storage    Updates the locations of each Kobra
       counter++;                         // counter variable plus 1
       error(x,y,h,v);                    //FFI: Death_Error    Possible errors that result in game over
       create_snake(x,y,h,v);             //FFI: Kobras    Creates each kobra
       tail();                            //FFI: Kobras    Deletes the tail
       create_ball();                     //FFI: Ball Functions    Creates the gold ball
       new_ball(x,y,h,v,width,height);    //FFI: Ball_Functions    Generates new cordinates for the new ball
     }
     
    }
}




 

 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  

  
