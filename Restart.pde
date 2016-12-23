//This function restarts the whole game
//It's just a duplicate of the "Global_Variables" tab to restart the game to it's intital stage.
//IT also copies the audio files from "Setup_Functions" to restart the audio
void restart()
{
  fill(0);  //Fill black
    noStroke();   //Take away the red stroke outline
    rect(0,height-75,width,75);  //Create a rectangle at the bottom of the screen
    fill(255);  //Font colour
    text("Back", 300,height-40);    //Print "Back" in the rectangle
  if( height-75 < mouseY &&  mousePressed)
    {
     game=false;            //INTI game screen to false
     instructions = false;   //INTI instuctions menu to false
      
      
      
      size = 10;    //INTI the size of the Kobra's to 10
      speed=4;      //INTI default speed to 4
      big = 20;    //INTI how big the snake gets before the tail gets cut off to 20
      
      
       //Kobra 1 variables (GREEN)
       x=width/2 + size;
       y=height/2;                      //Declare x and y coordinates of Kobra 1
       first_up = false;    //INTI up direction to false
       first_down = false;  //INTI down direction to false
       first_left = false;  //INTI left direction to false
       first_right = true;  //INTI right direction to true, makes the Kobra move right once the game starts 
       lose_p1=false;      //INTI player one losing to false. When it is true it means player one lost
       tail_p1=0;              //INTI player one's tail to 0
       n = 0;                  //INTI the parameter which big references as the zero point
      
      
       //Kobra 2 variables ( RED)
       h=width/2-size;
       v=height/2;                       //Declare x and y coordinates of Kobra 2
       sec_up = false;       //INTI up direction to false
       sec_down = false;    //INTI down direction to false
       sec_left = true;    //INTI left direction to true. The kobra will move left once the game starts
       sec_right = false;  //INTI right direction to false
       lose_p2=false;      //INTI player two losing to false. When it is true it means player two lost
       tail_p2=0;               //INTI player two's tail to 0
       m = 0;                  //INTI the parameter which big references as the zero point    
          
          
       //Ball Variables 
       a=350;    //INTI x coordinate of the ball to 350
       b=300;    //INTI y coordinate of the ball to 300
      
       //Counter: Used to determine certain indices from the master array
       counter=-1;    //INTI counter to -1
      
       //Determines whether the game has ended or not. If it is true, the game is over.
       end = false;    //INTI end to false
       //Speed Level Variables: Control which one is highlighted on the home screen
       level_1=false;    //INTI level_1 to false
       level_2=true;     //INTI level_2 to true: This tile starts coloured
       level_3=false;    //INTI level_3 to false
      
      
      
      // Create an array called "all"
      update [] all = new update [999999];    //INTI array to a new array of index 999999 of class update
      
      minim = new Minim(this);      //Audio Library
      player = minim.loadFile("death.mp3",2048);        //Game over audio
      player2 = minim.loadFile("mainmusic.mp3",2048);    //Game audio
      intro = minim.loadFile("crazy_train.mp3",2048);     //Main screen audio

         
    } 
  else if( height-75 < mouseY)    //If the mouse is just over the rectangle
    {
     fill(255,0,0,65);    //Red tint
     rect(0,height-75,width,75);    //Tint the rectangle red
    }
  
    
  
}